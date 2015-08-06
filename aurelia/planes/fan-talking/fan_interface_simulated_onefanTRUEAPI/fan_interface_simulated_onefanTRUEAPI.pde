
//

//fans
PImage blades;
PImage base;

//declare array of SpinningFan
SpinningFan[] fans = new SpinningFan[25]; // declare array of objects called fans

int fanside;

//look at drawing to see difference
int currentFlightSlot = 0;
int currentFlightPosition = 0;

JSONObject json;
ArrayList<FlightData> flights; //introuding -UPPERCASE when in array list , replaces many FlightData as a current flight varirable (soma), with one (pulling i from an array list called flights)


int start;
//int mode = 0;
int col, row;

//tell processing where USB port is located
import processing.serial.*; //import the library to read Serial port from Arduino

Serial port; // create a variable for the port
int motorval; //data sent to the serial port

void setup() {
  size(600, 600);

  ////to tes
  //println(Serial.list()); //use the first time to know USB port where data comes from
  //String portName = Serial.list()[5]; // tell processing the port that communicates with arduino
  //port = new Serial(this, portName, 9600); // will open the channel to send the data to send to arduino

  //fans
  blades = loadImage("fan.png");
  base = loadImage("fan_empty.png");

  fanside = base.width;



  float cols = 5; //play with this # to change # columns

  for (int i=0; i<fans.length; i++) {
    //columns code go from 1d index position to 2d grid position, also used in image
    float rowX = i % cols; // i%col = i remainder (how many times does i go into columns)
    float colY = (i-rowX) / cols; // finds corresponding row

    fans[i] = new SpinningFan(rowX*fanside +fanside/2, colY*fanside + fanside/2); // play w/ these: spaced out by 20, offset by 100
  
  }
  //time
  start = millis(); //now

  //#1 LOAD JSON, ARRAY LIST, 
  
  flights = new ArrayList<FlightData>(); // initializing, empty when creating/initializing

   getNewData(); // calling a function called getnew data , uses array list so after
   row = 0;
   col = 0;
 
}

void draw() {
  background(0);
  // fan display
  //if (mode == 0) {
    
  for (int i=0; i<fans.length; i++) {
    fans[i].display();
    //draw square based on global var info
    fill(255, 0, 0, 20);
    rect(col*fanside, row*fanside, fanside, fanside);
  }


  String arduinoMessage = fans[0].motorval + "\n";
  //println(arduinoMessage);
  //port.write(arduinoMessage); //sends to arduino

  //} else if (mode == 1) {
  //simulated pathway over time
  if (millis() - start > 100) {//has it been 1/10th of a second since our last 'start'
    //whatever we want to do every 2 seconds goes here
    getNewDataPoint();
    start = millis();
  }
}
////if keypressed to toggle views
//  if( isSpinning = true ){  mode = 1; }
//  if( d > 50 ){  mode = 2; }
//}



////fan function to move with mouse position
//void mouseMoved() {
//  for (SpinningFan thisfan : fans) { //short hand for looping through the array fans and assigning that one the one thisfan
//    if (mouseX > thisfan.x-fanside/2 && mouseX < thisfan.x+fanside/2 && 
//      mouseY > thisfan.y-fanside/2 && mouseY < thisfan.y+fanside/2) { 
//      thisfan.isSpinning = true;
//    } else {
//      thisfan.isSpinning = false;
//    }
//  }
//}

// real pathway function to move dots over time
void getNewDataPoint() {
  int fanside = width/5; 
  FlightData currentFlight = flights.get(currentFlightSlot);
  
  //int totalFlightPositions = currentFlight.lats.size();
  currentFlightPosition = (currentFlightPosition + 1);
  
  if( currentFlightPosition > currentFlight.lats.size() - 1){
    currentFlightSlot = (currentFlightSlot + 1) % flights.size();  
    currentFlightPosition = 0;
  }
  

  //original API ranges
  float latitude = (currentFlight.lats.get(currentFlightPosition));   //get 1st position of 1st flight y
  float longitude =(currentFlight.lons.get(currentFlightPosition));   //get 1st position of 1st flight x
  
  //map to screen (pixel) ranges, which are used to draw the small ellipses for debugging the paths
  int latitudeInPixels = round(map(latitude, currentFlight.latMin, currentFlight.latMax, 0, width));
  int longitudeInPixels = round(map(longitude, currentFlight.lonMin, currentFlight.lonMax, 0, height));
  
  //row = round(map(latitude, 40, 45, 0, 4));
  //col = round(map(longitude, -125, -120, 0, 4));
  
  //map to columns and rows, which are used to draw the red rectangles in the draw function
  col = round(map(latitudeInPixels, 0, width, 0, 4));
  row = round(map(longitudeInPixels, 0, height, 0, 4));
  
  //row = round(longitude / fanside);
  //col = round(latitude / fanside);

  for (SpinningFan thisfan : fans) { //short hand for looping through the array fans and assigning that one the one thisfan

    if (latitudeInPixels > thisfan.x-fanside/2 && latitudeInPixels < thisfan.x+fanside/2 && 
      longitudeInPixels > thisfan.y-fanside/2 && longitudeInPixels < thisfan.y+fanside/2) { 
      thisfan.isSpinning = true;
      fill(255, 255, 255);
      ellipse(latitudeInPixels, longitudeInPixels, 4, 4);
    } else {
      thisfan.isSpinning = false;
    }
  }

  fans[0].isSpinning = true;//DELETE THIS LINE

}
















//converting json data to objects so processing (java) can read it
//writing: clearing and populating array list flights of object type FlightData which has flight id, lat and lon
void getNewData() {
  flights.clear(); //before calling new data, clear (function of array list is preefined by java) array list with variable name flights
  //make json request
  json = loadJSONObject("https://api.flightstats.com/flex/flightstatus/rest/v2/json/flightsNear/45/-125/40/-120?appId=927ec82e&appKey=db433b3835c3e1243047ac0d66a5fea3&maxFlights=5"); // sets larger airport area
  //println(json);

  JSONArray flightArray = json.getJSONArray("flightPositions");
  println(flightArray);

  //looking through the array flightArray
  for (int i=0; i<flightArray.size(); i++) {
    FlightData currentFlight = new FlightData(flightArray.getJSONObject(i).getString("callsign")); // current flight is its actual instance, FlightData is a custom variable type

    //println(flightArray.getJSONObject(i).getString("callsign")); //getFloat if it was the number returned

    JSONArray positions = flightArray.getJSONObject(i).getJSONArray("positions");

    //
    //add to current flight by calling function .add w/ lat and lon
    for (int j=0; j<positions.size(); j++) { // through the array list instead // why with j?
      float lat = positions.getJSONObject(j).getFloat("lat");
      float lon = positions.getJSONObject(j).getFloat("lon");

      currentFlight.addCoordinates (lat, lon); // have to teach it what to do by adding a function because we made the instance currentFlight of the object FlightData, how to access both lat and lon can't be arguments because doesn't have constructor?,
    }
    if (positions.size()>=9) { //if there are 10 or more positions within the array of flights
      flights.add(currentFlight); //array list of objects, knows that array lists have a function add (can only add types of the array list, i this case FlightData)
    }
    //START AT THIS LINE: get new flight button is working, flight data object
    //integrate into one fan
  }
}


//void keyPressed(){
// if(key == 'f') mode = 0; // to toggle view of fans
// //else if(key == 'v') mode = 1; // to toggle off view of fans

// if(key == 's') mode = 3; // to toggle view of squares
// //else if(key == 'x') mode = 4; // to toggle off view of squares
//}