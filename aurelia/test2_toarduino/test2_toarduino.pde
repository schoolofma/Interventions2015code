//practice communication from process > arduino
import processing.serial.*;

Serial port;

void setup() {
  String portName = Serial.list()[5]; // tell processing the port that communicates with arduino //ON/OFF
  port = new Serial(this, portName, 9600);
}

void draw() {
  
  port.write("0,255,255,0,0,0,255,0,0"); 
  println("sending");
}

void serialEvent(Serial myPort) {
  println(myPort.read());
}