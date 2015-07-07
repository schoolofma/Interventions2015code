Ball pip; // object of type all exists and is called
Ball pep;

//array of many
Ball[] circles = new Ball[100];

void setup (){
  size(600, 600);
  pip = new Ball(); // initialize the object
  pep = new Ball();
  for(int i=0; i < circles.length; i++){
    circles[i] = new Ball();
  }
}

void draw(){
  //background(255);
  //fill(pip.c);
  //ellipse(pip.x, pip.y, pip.sz, pip.sz);
  pip.update();
  pip.display();
  
  //fill(pep.c);
  //ellipse(pep.x, pep.y, pep.sz, pep.sz);
  pep.update();
  pep.display();
  for(int i=0; i < circles.length; i++){
    circles[i].update();
    circles[i].display();
  }
}

void keyPressed(){
 pip.reset();
 pep.reset(); 
 
   for(int i=0; i < circles.length; i++){
    circles[i].reset();
  }
  
}

//class Ball
//properties: x and y position, color, size
//functions: display, move it

class Ball{
 //PVector pos = new PVector(0,0);
  
 float x;
 float y;
 color c;
 float sz; 
 
 // constructor
 Ball(){
   reset(); // call reset to set random values
}

//reset my properties
void reset(){
   x= random(width);
   y= random(height);
   c = color(random(200,255));
   sz = random(1,50);
   noStroke();
  
}

//draw our ellipse, function to draw our Ball
void display(){
  fill(c, 10);
  ellipse(x,y,sz,sz);
}

void update(){
  x += random(-5,5);
  y += random(-5,5);
}



}

// could add speed, velocity, friction, change update function so they change in a different way
