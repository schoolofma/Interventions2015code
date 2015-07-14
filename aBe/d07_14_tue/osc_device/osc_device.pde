 
import oscP5.*;
import netP5.*;

float x, y, sz;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}


void draw() {
  background(0);
  ellipse(x, y, sz, sz);
}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("blabla");  
  myMessage.add(random(1)); // float
  oscP5.send(myMessage, myRemoteLocation); 
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage msg) {
  println(msg.addrPattern()); // /1/slide5
  println(msg.typetag()); //  f

  if(msg.checkAddrPattern("/1/slide5")) {
    if(msg.checkTypetag("f")) {
      float value = msg.get(0).floatValue();
      x = value * width;
    }
  }

  if(msg.checkAddrPattern("/1/slide2")) {
    if(msg.checkTypetag("f")) {
      float value = msg.get(0).floatValue();
      y = value * width;
    }
  }

  if(msg.checkAddrPattern("/1/slide3")) {
    if(msg.checkTypetag("f")) {
      float value = msg.get(0).floatValue();
      sz = value * 100;
    }
  }


}
