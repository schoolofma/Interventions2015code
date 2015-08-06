//position
//size
//rotation


//if flase doesnt send any motor vals

class SpinningFan {
  //class level here is reachable from outside
  float x=0;
  float y=0;
  float sz=20;
  float rot=random(TWO_PI);
  int motorval=0;

  boolean isSpinning = false; // false is default

  //constructor called when obj is created, can also pass it some initial starting parameters
  SpinningFan(float nx, float ny) { //best not to call these x and y so not to be confused
    x=nx;
    y=ny;
    //set initial values from sz and rot
  }


  void display() {
    if (isSpinning) {
      rot = rot + .01;//1/3.0;
      motorval=255;
    }
    else {
     motorval=0;
    }
    
    
    imageMode(CENTER);
    //rectMode(CENTER);
    pushMatrix();
    translate(x, y);

    image(base, 0, 0);



    rotate(rot);
    //rotate(rot);

    //rect(0, 0, sz, sz);
    image(blades, 0, 0);

    popMatrix();
  }

  //  void drawFan() {
  //    size(600, 600);

  //    fill(50);
  //    pushMatrix();
  //    translate(x, y);//at x and y positions listed above
  //    rotate(rot);
  //    scale(.25);

  //    for (int a=0; a<360; a=a+30) { //incre in steps of 30 from 0 to 360
  //      pushMatrix();
  //      rotate(radians(a));
  //      rect(20, 20, 200, 20);
  //      popMatrix();
  //    }
  //    ellipse(0, 0, 100, 100);

  //    popMatrix();
  //}
}