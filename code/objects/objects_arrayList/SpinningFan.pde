// position
// size
// rotation

class SpinningFan{

  float x;
  float y;
  float sz;
  float rot;
  
  // constructor is call when an object is created
  SpinningFan(float nx, float ny){
    x = nx;
    y = ny;
    rot = 0;
    sz = 20;
    // set initial values for sz and rot
  }
  
  void display(){
    rot += .1;
    rectMode(CENTER);
    pushMatrix();
      translate(x,y);
      rotate(rot);
      rect(0,0,sz,sz);
    popMatrix();
  }

}

