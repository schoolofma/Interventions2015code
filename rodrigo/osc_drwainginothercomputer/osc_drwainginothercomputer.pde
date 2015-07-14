import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
float posX=0; 
float posY=0;


void setup() {
  size(400, 400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 10000 */
  oscP5 = new OscP5(this, 10000);
  myRemoteLocation = new NetAddress("192.168.2.162", 10000); //Puerto de Alex.
}

void draw () {

  fill(255, 255, 0); 
  ellipse(posX, posY, 20, 20);
 ellipse(posY, posX, 2, 20);
  noStroke ();
}
void mouseMoved () {

  OscMessage myMessage = new OscMessage("/mouseXY");

  myMessage.add(mouseX);
  myMessage.add(mouseY);
  noStroke();
  fill(0, 255, 0); 
  ellipse(mouseX, mouseY, 10, 10);

  oscP5.send(myMessage, myRemoteLocation);
}

void oscEvent (OscMessage theOscMessage) {

  String addr = theOscMessage.addrPattern();

  println(" addrpattern: "+theOscMessage.addrPattern());


  if (addr.equals ( "/mouseXY")) {

    posX =  theOscMessage.get(0).intValue();
    posY =  theOscMessage.get(1).intValue();
  }
}

void mousePressed () {
}

