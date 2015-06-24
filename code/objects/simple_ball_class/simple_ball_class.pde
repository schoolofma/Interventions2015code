// array of many
Ball [] circles = new Ball[100];

void setup(){
  
  size(300,300);
  

  for(int i = 0; i < circles.length; i++){
    circles[i] = new Ball();
  }
  
}

void draw(){
  background(0);

  // loop through all 100 and call each one's display function
  for(int i = 0; i < circles.length; i++){
    circles[i].update();
    circles[i].display();
  }
  
}

void keyPressed(){
  // loop through all circles and call each one's reset
  for(int i = 0; i < circles.length; i++){
    circles[i].reset();
  }
}

// class Ball
// properties: x and y position, color, size
// functions: reset, display, move it

class Ball{
  
  float x;
  float y;
  color c;
  float sz;
  
  // constructor
  Ball(){
    reset(); // call reset to set random values
  }
  
  // reset my properties
  void reset(){
    x = random(300);
    y = random(300);
    c = color( random(255), random(255), random(255) );
    sz = random(10,40);
  }
  
  // funtion to draw our Ball
  void display(){
    fill(c);
    ellipse(x,y,sz,sz);
  }
  
  void update(){
    x += random(-1,1);
    y += random(-1,1);
  }
  
  
}

