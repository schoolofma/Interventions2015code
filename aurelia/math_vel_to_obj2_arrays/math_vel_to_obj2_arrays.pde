//declare array of 100 partcile objects
Particle[] particles = new Particle[100]; // declare array of objects called Particle


void setup() {
  size(500, 500);
  //initialze each object in the array
  for(int i=0;i<particles.length; i++){
    particles[i] = new Particle();
  }
}

void draw() {
  background(200); 
  
  for(int i=0;i<particles.length; i++){
  particles[i].update();
  particles[i].display();
  }
  //loop through all indixes and call upate and display 
  //for each obj

}

void keyPressed(){
  
  for(int i=0;i<particles.length; i++){
  particles[i].key();
  }
}

//void mousePressed() {

// x = mouseX;
// y = mouseY;
// velX = 0;
// velY = 0;
//}