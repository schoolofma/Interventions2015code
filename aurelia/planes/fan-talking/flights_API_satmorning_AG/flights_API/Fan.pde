class Fan{
  float row;
  float col;
  boolean isSpinning;
  
  //physical interface vars
  int motorVal;
  
  //graphical interface vars
  PImage blades;
  PImage base;
  float side;
  float rotation;
  
  Fan(float aRow, float aCol){
    row = aRow; 
    col = aCol;
    isSpinning = false;
    
    motorVal = 0;
    
    blades = loadImage("fan.png");
    base = loadImage("fan_empty.png");
    side = base.width;  //or 20?
    rotation = random(TWO_PI);
    
  }
  
  void update(){
    if(isSpinning) {
      rotation = rotation + .01;
      motorVal = 255;
    }
    else {
     motorVal = 0;
    }
  }
  
  void display() {
    imageMode(CENTER);
    pushMatrix();
    translate(row*side + side/2, col*side + side/2);
      image(base, 0, 0);
      rotate(rotation);
      image(blades, 0, 0);
      if(isSpinning){
        rectMode(CENTER);
        fill(255, 0, 0, 20);
        rect(0, 0, side, side);
      }
    popMatrix();
  }
  
}
