//lcd try 2


import processing.serial.*; // this library will connect arduino and processing
Serial port; // Create a port to send the values to arduino 

void setup() { 
      size(200, 200); 
      String portName = Serial.list()[2]; // tell processing the port that communicates with arduino
      port = new Serial(this, portName, 9600); // will store the data to send to arduino
    } 

    void draw() { 
      //int ledValue = int(map(mouseX, 0, 200, 0, 255));  // Scale the value to the range 0-255
      port.write("a"+ mouseX);                      // Write the value to the serial port
      //println(int(mouseX));
    }