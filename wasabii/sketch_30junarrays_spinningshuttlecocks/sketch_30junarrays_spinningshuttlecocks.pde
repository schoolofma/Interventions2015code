Particle a;
Particle []many =new Particle[9];



void setup() {
  size(800, 800);
  float cols=3;
  a=new Particle(10, 10);
  a.x = width/2;
  for (int i=0; i<many.length; i++) {
    float rowX=i % cols;
    float colY=(i-rowX)/cols;
    many[i]=new Particle(100+rowX*300, 100+colY*300);
  }
}

void draw() {
  background(255);
 // a.display();
  //a.update();
  //a.mousymove();
  for (int i=0; i<many.length; i++) {
   many[i].display();
    many[i].update();
    many[i].mousymove();
    
  }
}

void mousePressed() {
}

void keyPressed() {
  if (key=='s') {
    //save(System.currentTimeMills(),".png");
  }
}

