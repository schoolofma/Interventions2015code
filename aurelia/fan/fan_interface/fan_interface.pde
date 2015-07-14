//single object
//SpinningFan myFan;

//declare array of SpinningFan
//classType [] nameOfArray = new classType[10]
SpinningFan[] fans = new SpinningFan[100]; // declare array of objects called Particle
//Particle[] particles = new Particle[100]; // declare array of objects called Particle


void setup() {
  size(600, 600);

  //setup initial conditoins_
  //myFan = new SpinningFan(100, 100);
  float cols = 10; //play with this # to change # columns

  for (int i=0; i<fans.length; i++) {
    //columns code go from 1d index position to 2d grid position, also used in image
    float rowX = i % cols;
    float colY = (i-rowX) / cols; // finds corresponding row

    fans[i] = new SpinningFan(rowX*80 +100, colY*80 + 100); // play w/ these: spaced out by 20, offset by 100
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