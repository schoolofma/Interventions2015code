
Particle p;
Particle a;
void setup() {
  size(500, 500);
  p = new Particle();
  a = new Particle();
  
  
 
}

void draw() {
  background(200);
  p.display();//to call class always have display then update.
  p.update();
  
  a.display();
  a.update();

 
}

void keyPressed() {


p.movement();
a.movement();
  
}

void mousePressed() {

  p.mousymove();
  a.mousymove();

}

