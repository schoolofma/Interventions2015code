//create a class call Particle
// start moving the varaibales from the main program into the class
//move the updates to variables 


class Particle {
  //variables belonging to the class--
  float x = 0;
  float y = 0;
  float velX = 0;
  float velY = 0;
  float damp = .01;
  int radius = 10;

  //constructor--called when an onject is initialised.variables are given inital values here
  Particle() {

    x = random(width/2);
    y = random(height/2);
  }
  //end of class particle

  //functions of class
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
      //also check in y
    }

    if ( y < radius) {
      velY *= -1;
      y = radius;
    } else if ( y > height-radius) {
      velY *= -1;
      y = height - radius;
    }
  }// end update

  void movement() {


    float force = random(0, 20);

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

  void mousymove() {

    x = mouseX;
    y = mouseY;
    velX = 0;
    velY = 0;
  }




  void display() {// you can name your fucntions any name eg here its called display
    noStroke();

   ellipse(x, y, radius*2, radius*2);
  }
}

