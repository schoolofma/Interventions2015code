import processing.serial.*;

ArrayList<Flight> flights; 
Flight currentFlight;
int currentFlightSlot;
int currentFlightPosition;

//API vars
int intervalAPI = 50000; //call API every 50 seconds
int lastTimeAPI;
String query = "https://api.flightstats.com/flex/flightstatus/rest/v2/json/flightsNear/45/-125/40/-120?appId=927ec82e&appKey=db433b3835c3e1243047ac0d66a5fea3&maxFlights=5";

//Arduino communication vars
Serial port;
boolean firstContact; 

//interface vars
Fan[][] fans;
int rows, cols;
int lastTimeAnimation;
int intervalAnimation; 
int col, row; //used to draw red rectangles on screen
int latitudeInPixels;
int longitudeInPixels;


//turn debugging messages on or off
boolean debug = true;

void setup() {
  size(600, 600);
  flights = new ArrayList<Flight>();

  //API
  lastTimeAPI = millis();
  getNewData();

  //Arduino
  println(Serial.list()); //use the first time to know USB port where data comes from
  //  String portName = Serial.list()[7]; // tell processing the port that communicates with arduino
  //  port = new Serial(this, portName, 9600); // will open the channel to send the data to send to arduino
  firstContact = false;

  //interface vars
  lastTimeAnimation = millis();
  intervalAnimation = 1000;
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
  background(255); //erase screen to watch things move

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
  if (millis() - lastTimeAnimation > intervalAnimation) {//has it been 1/10th of a second since our last 'start'
    //whatever we want to do every 2 seconds goes here
    moveToNextFlightPosition();
    lastTimeAnimation = millis();
  }

  sendDataToArduino();
  fill(255, 0, 0);
  ellipse(latitudeInPixels,longitudeInPixels, 10, 10);
}

void moveToNextFlightPosition() {
  Flight currentFlight = flights.get(currentFlightSlot);
  currentFlightPosition = currentFlightPosition + 1;

  if ( currentFlightPosition > currentFlight.coordinates.size() - 1) {
    currentFlightSlot = (currentFlightSlot + 1) % flights.size();  //go through all flight slots
    currentFlightPosition = 0;
  }

  //original API ranges
  float latitude = (currentFlight.coordinates.get(currentFlightPosition).x);   //get 1st position of 1st flight y
  float longitude =(currentFlight.coordinates.get(currentFlightPosition).y);   //get 1st position of 1st flight x

  //map to screen (pixel) ranges, which are used to draw the small ellipses for debugging the paths
  latitudeInPixels = round(map(latitude, currentFlight.latMin, currentFlight.latMax, 0, width));
  longitudeInPixels = round(map(longitude, currentFlight.lonMin, currentFlight.lonMax, 0, height));



  //row = round(map(latitude, 40, 45, 0, 4));
  //col = round(map(longitude, -125, -120, 0, 4));

  //map to columns and rows, which are used to draw the red rectangles in the draw function
  col = round(map(latitudeInPixels, 0, width, 0, cols));
  row = round(map(longitudeInPixels, 0, height, 0, rows));

  println(col, row, latitudeInPixels, longitudeInPixels);

  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      Fan thisFan = fans[i][j];
      if (col==j && row ==i) { 
        thisFan.isSpinning = true;
      } else {
        thisFan.isSpinning = false;
      }
    }
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
  //  println(arduinoMessage);
  //  port.write(arduinoMessage); //sends to arduino
}

//API Communication
void getNewData() {
  if (debug) println("Fetching new data...");

  flights.clear();
  JSONObject json = loadJSONObject(query); 
  JSONArray flightArray = json.getJSONArray("flightPositions");

  if (debug) println(flightArray);

  for (int i=0; i<flightArray.size(); i++) {
    JSONArray positions = flightArray.getJSONObject(i).getJSONArray("positions");
    if (positions.size() >= 9) {
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