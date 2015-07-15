import oscP5.*;
import netP5.*;

float x, y, sz;
  
OscP5 oscP5;
NetAddress supercollider;

void setup() {
  size(400,400);
  frameRate(25);

  oscP5 = new OscP5(this, 12000);
  supercollider = new NetAddress("127.0.0.1", 57120);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
  // option 1, making rhythms with 6 different notes
  int[] freqs = {60, 62, 65, 48, 50, 53};
  // send a message to supercollider once every 3 frames
  if(frameCount % 3 == 0) {
    OscMessage myMessage = new OscMessage("/starhit");
    // send a random pitch
    myMessage.add(freqs[(int)random(freqs.length)]); 
    oscP5.send(myMessage, supercollider);
  }
}
// option 2, send notes when pressing keys
void keyPressed() {    
    int frq = 0;
    switch(key) {
      case 'a': frq = 1; break;
      case 'b': frq = 2; break;
      case 'c': frq = 3; break;
      // ... etc ...
    }
    OscMessage myMessage = new OscMessage("/starhit");
    myMessage.add(frq); 
    oscP5.send(myMessage, supercollider);  
}

// option 3, send notes when pressing the mouse
void mousePressed() {
  OscMessage myMessage = new OscMessage("/starhit");  
  myMessage.add(12 + (mouseX % 60)); 
  oscP5.send(myMessage, supercollider);
  fill(255);
  ellipse(mouseX, mouseY, 30, 30);
}

