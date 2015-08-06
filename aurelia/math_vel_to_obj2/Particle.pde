//acts as an extension below
//create a class called particle
//start moving the variabes from the main program into the class 
//move updates to variables to update function

class Particle {
//move our variables, in this case they are both declared and given a value (ok if just setting an initial value, if with af unction better to include within constructor
  float x = 0;
  float y = 0;
  float velX = 0;
  float velY = 0;
  float damp = .01; // friction
  int radius = 10; 

//make a constructor
//just starts with name of class no "void", makes a template which sets some initial values
  Particle() {
    x = random(width);
    y = random(height);
    velX = random(-5.5);
     velY = random(-5.5);

    
  }

//update function, doesn't have to be called update, but updating variables
  void update() {

    // add velocity to position
    y += velY;
    x += velX;

    // add friction to velocity
    velX += -velX*damp;
    velY += -velY*damp;

    // bounce off walls and stay inside
    if ( x < radius) {
      velX *= -1;
      x = radius;
    } else if (x > width-radius) {
      velX *= -1;
      x = width-radius;
    }

    //also check in y
    if ( y < radius) {
      velY *= -1;
      y = radius;
    } else if ( y > height-radius) {
      velY *= -1;
      y = height - radius;
    }
   

    // calculate distance betweeen target and little ellipse
    //float d = dist(x,y,targetX,targetY);
  }
  
  void display(){
        ellipse(x, y, radius*2, radius*2);
  }
  
  void key(){
   
 float force = 2;

 if (key == CODED) {

   if (keyCode == UP) { 
     velY -= force;
   } else if (keyCode == DOWN) { 
     velY += force;
   } else if (keyCode == LEFT) { 
     velX -= force;
   } else if (keyCode == RIGHT) { 
     velX += force;
   }
 } 
  }
}//end of class Particle