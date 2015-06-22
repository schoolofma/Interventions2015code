import processing.serial.*;

Serial port; 

int val;

void setup() {
  
  size (1920,1000);
  println (Serial.list());
  String portName = Serial.list()[0];
  port = new Serial (this, portName, 9600);
  
  background(0);
  
  
  



}

void draw(){
  
  
  
  
  
  
  
  
  if(0<port.available())
  {
    background(0);
    val = port.read();
    println(val);
    noStroke();
    fill(255, 0, 0, val);
    ellipse(width/2,height/2, val*3, val*3);
    
    
  }
  
}
