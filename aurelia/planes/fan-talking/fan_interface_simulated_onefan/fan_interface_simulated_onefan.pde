


//fans
PImage blades;
PImage base;

//declare array of SpinningFan
SpinningFan[] fans = new SpinningFan[25]; // declare array of objects called fans

int fanside;

//simulated pathway
int latitude;
int longitude;

int start;
//int mode = 0;
int col, row;

//tell processing where USB port is located
import processing.serial.*; //import the library to read Serial port from Arduino

Serial port; // create a variable for the port
int motorval; //data sent to the serial port

void setup() {
  size(600, 600);

  //to tes
  println(Serial.list()); //use the first time to know USB port where data comes from
  String portName = Serial.list()[5]; // tell processing the port that communicates with arduino
  port = new Serial(this, portName, 9600); // will open the channel to send the data to send to arduino

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

    //time
    start = millis(); //now

    // simulated pathway
    latitude = round(random(0, width/2));
    longitude = round(random(0, height/2));
  }
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
  port.write(arduinoMessage); //sends to arduino
  
  //} else if (mode == 1) {
  //simulated pathway over time
  if (millis() - start > 100) {//has it been 2 seconds since our last 'start'
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

// simulated pathway function to move dots over time
void getNewDataPoint() {
  int fanside = width/5; 
  latitude = latitude + round(random(-1, 5))*5; //y
  longitude = longitude + round(random(-1, 5))*5; //x

  row = (longitude / fanside);
  col = (latitude / fanside);

  for (SpinningFan thisfan : fans) { //short hand for looping through the array fans and assigning that one the one thisfan

    if (latitude > thisfan.x-fanside/2 && latitude < thisfan.x+fanside/2 && 
      longitude > thisfan.y-fanside/2 && longitude < thisfan.y+fanside/2) { 
      thisfan.isSpinning = true;
      fill(255, 255, 255);
      ellipse(latitude, longitude, 4, 4);
    } else {
          thisfan.isSpinning = false;
    }    
  }
  
  fans[0].isSpinning = true;//DELETE THIS LINE
  
  


  // //draw long and lat lines - how is this disappeared???
  // for (int i = 0; i < 5; i++) {
  //   line(i*fanside, 0, i*fanside, height);
  //   line(0, i*fanside, width, i*fanside);
  // }
}

//void keyPressed(){
// if(key == 'f') mode = 0; // to toggle view of fans
// //else if(key == 'v') mode = 1; // to toggle off view of fans

// if(key == 's') mode = 3; // to toggle view of squares
// //else if(key == 'x') mode = 4; // to toggle off view of squares
//}