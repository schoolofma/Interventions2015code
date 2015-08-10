import processing.serial.*;

ArrayList<Flight> flights; 
Flight currentFlight;
int currentFlightSlot;
int currentFlightPosition;

//API vars
int intervalAPI = 50000; //call API every 50 seconds
int lastTimeAPI;
//http://latlon.net/ to find lats + lons
String query = "https://api.flightstats.com/flex/flightstatus/rest/v2/json/flightsNear/52.60/13.16/52.38/13.61?appId=927ec82e&appKey=db433b3835c3e1243047ac0d66a5fea3&maxFlights=5";
//String query = "1439032506482.json"; //for testing with saved file

//Arduino communication vars
Serial port;
boolean firstContact; 

//interface vars
Fan[][] fans;
int rows, cols;
int lastTimeAnimation;
int nextTimeAnimation; 
int col, row; //used to draw red rectangles on screen



//turn debugging messages on or off
boolean debug = true;

void setup() {
  size(600, 600);
  flights = new ArrayList<Flight>();

  //API
  lastTimeAPI = millis();
  getNewData();

  //Arduino
  //println(Serial.list()); //use the first time to know USB port where data comes from
   String portName = Serial.list()[5]; // tell processing the port that communicates with arduino //ON/OFF
   port = new Serial(this, portName, 9600); // will open the channel to send the data to send to arduino/ON/OFF
  firstContact = false;

  //interface vars
  lastTimeAnimation = millis();
  nextTimeAnimation = lastTimeAnimation+ 1000; //sets next event 1 sec in future (rather than interval)
  rows = 3;
  cols = 3;
  fans = new Fan[rows][cols];
  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      fans[i][j] = new Fan(i, j); // play w/ these: spaced out by 20, offset by 100
    }
  }

  currentFlightSlot = 0;
  currentFlightPosition = 0;
}

void draw() {
  //background(255); //erase screen to watch things move

  //update API data
  //if enough time has passed
  if (millis() - lastTimeAPI > intervalAPI) {
    getNewData();
    lastTimeAPI = millis();
  }

  //draw grid
  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      fans[i][j].update();
      fans[i][j].display();
    }
  }

  //animate: display next flight position (move the red square
  if (millis() > nextTimeAnimation) {//has it been enough time that spassed to trigger a nee event
    //whatever we want to do every 2 seconds goes here
    moveToNextFlightPosition();
  }
 
 if (frameCount%15 == 0) { //every 15 frames sends data
  sendDataToArduino();
 }
}

void moveToNextFlightPosition() { // if no flightg data then don't go through to next flight position
  if (flights.size()<1) {
    return;
  }
  
  //Do this in case data was loaded and nw we have less flights than before
  //it makes sure that currentFlightSlot is  the vald range.
  currentFlightSlot = currentFlightSlot % flights.size();
  
  Flight currentFlight = flights.get(currentFlightSlot);

  //DEBUG AREA
  fill(255, 0, 0);
  rectMode(CORNER);
  rect(width-100, height-100, 100, 100);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(3);
  beginShape();
  for (PVector p : currentFlight.coordinates) {
    vertex(
      map(p.x, currentFlight.latMin, currentFlight.latMax, width-100, width),
      map(p.y, currentFlight.lonMin, currentFlight.lonMax, height-100, height)
      );
  }
  endShape();

  //original API ranges
  float latitude = (currentFlight.coordinates.get(currentFlightPosition).x);   //get 1st position of 1st flight y
  float longitude =(currentFlight.coordinates.get(currentFlightPosition).y);   //get 1st position of 1st flight x

  //map to screen (pixel) ranges, which are used to draw the small ellipses for debugging the paths
  col = floor(map(latitude, currentFlight.latMin, currentFlight.latMax, 0, cols-1));
  row = floor(map(longitude, currentFlight.lonMin, currentFlight.lonMax, 0, rows-1));

  println(col, row);

  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      Fan thisFan = fans[i][j];
      if (col==j && row ==i) { 
        thisFan.startSpinning();
      }
    }
  }

  currentFlightPosition = currentFlightPosition + 1;
  lastTimeAnimation = millis();

  if ( currentFlightPosition > currentFlight.coordinates.size() - 1) { //?if the position > all available coordinates (min 5), meaning at the end
    currentFlightSlot = (currentFlightSlot + 1) % flights.size();  //go through all flight slots
    currentFlightPosition = 0;
    nextTimeAnimation=lastTimeAnimation+5000; //wait 5 sec (to show at end) then show next plane event 
    println("wait 5 seconds");
  } else { //otherwise
    nextTimeAnimation=lastTimeAnimation+1000; //wait 1 sec to show each next plane position (next flght position)1 sec
  }
}

//Arduino Communication
void sendDataToArduino() {
  String arduinoMessage = "";
  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      arduinoMessage += fans[i][j].motorVal + ", ";
    }
  }
   println(arduinoMessage);
   port.write(arduinoMessage); //sends to arduino //ON/OFF
}

//API Communication
void getNewData() {
  if (debug) println("Fetching new data...");

  flights.clear();
  JSONObject json = loadJSONObject(query); 



  saveJSONObject(json, System.currentTimeMillis() + ".json");

  JSONArray flightArray = json.getJSONArray("flightPositions");

  if (debug) println(flightArray);

  for (int i=0; i<flightArray.size(); i++) {
    JSONArray positions = flightArray.getJSONObject(i).getJSONArray("positions");
    if (positions.size() >= 9) { //changed fro 9 to 4 to get at least 5 positions ??
      Flight flight = new Flight(flightArray.getJSONObject(i).getString("callsign")); //"callsign" is the flight's ID

      for (int j=0; j<positions.size(); j++) { 
        float lon = positions.getJSONObject(j).getFloat("lon");
        float lat = positions.getJSONObject(j).getFloat("lat");
        flight.addCoordinates(lon, lat);
      }
      flights.add(flight);
    }
  }
  if (debug) {
    println("loaded " + flights.size() + " flights");
    println(flights);
  }
}

void serialEvent(Serial myPort) {
  println("serial");
  int[] serialInArray = new int[3];    // Where we'll put what we receive
  int serialCount = 0;
  int xpos, ypos;  
  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A,
  // clear the serial buffer and note that you've
  // had first contact from the microcontroller. 
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') { 
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      // ask for more
    }
  } else {
    //    // Add the latest byte from the serial port to array:
    //    serialInArray[serialCount] = inByte;
    //    serialCount++;
    //
    //    // If we have 3 bytes:
    //    if (serialCount > 2 ) {
    //      xpos = serialInArray[0];
    //      ypos = serialInArray[1];
    //
    //      // print the values (for debugging purposes only):
    //      println(xpos + "\t" + ypos + "\t" );
    //
    //      // Send a capital A to request new sensor readings:
    //      myPort.write('A');
    //      // Reset serialCount:
    //      serialCount = 0;
    //    }
  }
}