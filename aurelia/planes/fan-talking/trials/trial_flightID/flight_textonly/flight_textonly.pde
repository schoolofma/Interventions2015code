//string only for plane data
//change API query: both arrivals + departures

PFont mono;

void setup() {
  size(960, 640);
  background(0);



  //changefont
  //textFont(mono);
  //mono=loadFont("AndaleMono.ttf");
}

void draw() {
  fill(#31D358);
  textSize(32);
  //textkerning?
  String s= "Flight 437 British Airlines";
  s= s.toUpperCase();
  text(s, width/2-200, height/2-150, 500, 300); //text wraps around box

  String s2= "Dallas >>> Berlin";
  s2= s2.toUpperCase();
  text(s2, width/2-200, height/2-100, 350, 300); //text wraps around box
}

//if (keyPressed == true) {
////guide-TURN ON
//fill(90);
//rectMode(CENTER);
//rect(width/2, height/2, 600, 300);
//} 