
PImage blades;
PImage base;
//declare array of SpinningFan
SpinningFan[] fans = new SpinningFan[25]; // declare array of objects called fans

int fanside;



void setup() {
  size(600, 600);
  blades = loadImage("fan.png");
  base = loadImage("fan_empty.png");

  fanside = base.width;

  //setup initial conditoins_
  //myFan = new SpinningFan(100, 100);
  float cols = 5; //play with this # to change # columns

  for (int i=0; i<fans.length; i++) {
    //columns code go from 1d index position to 2d grid position, also used in image
    float rowX = i % cols; // i%col = i remainder (how many times does i go into columns)
    float colY = (i-rowX) / cols; // finds corresponding row

    fans[i] = new SpinningFan(rowX*fanside +fanside/2, colY*fanside + fanside/2); // play w/ these: spaced out by 20, offset by 100
    //fans[i] = new SpinningFan(i*30,100);
    // particles[i] = new Particle();
  }
}

void draw() {
  background(0);
  //call display for myFan

  for (int i=0; i<fans.length; i++) {
    fans[i].display();
    //fans[i].drawFan();

    //  particles[i].update();
  }
  //myFan.display();
}

void mouseMoved() {
  for (SpinningFan thisfan : fans) { //short hand for looping through the array fans and assigning that one the one thisfan
    if (mouseX > thisfan.x-fanside/2 && mouseX < thisfan.x+fanside/2 && 
      mouseY > thisfan.y-fanside/2 && mouseY < thisfan.y+fanside/2) { 
      thisfan.isSpinning = true;
    } else {
      thisfan.isSpinning = false;
    }
  }
}