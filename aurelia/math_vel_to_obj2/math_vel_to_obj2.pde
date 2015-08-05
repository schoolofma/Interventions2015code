Particle p; //itroducting p object
Particle p2; //itroducting p object



void setup() {
  size(500, 500);
  p = new Particle(); // initialize class
  p2 = new Particle(); // initialize class

}

void draw() {
  background(200); 
  p.update();
  p.display();
    p2.update();
  p2.display();

}

void keyPressed(){
  p.key();
  p2.key();

}

//void mousePressed() {

// x = mouseX;
// y = mouseY;
// velX = 0;
// velY = 0;
//}