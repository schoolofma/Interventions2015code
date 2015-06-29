float x = 0;
float y = 0;
float velX = 0;
float velY = 0;
float damp = .01;
int radius = 10;


void setup() {
  size(500, 500);
  x = random(width);
  y = random(height);
}

void draw() {
  background(200);

  // add velocity to position
  y += velY;
  x += velX;

  // add friction to velocity
  velX += -velX*damp;
  velY += -velY*damp;

  ellipse(x, y, radius*2, radius*2);
  
  // bounce off walls and stay inside
  if( x < radius){
    velX *= -1;
    x = radius;
  }else if(x > width-radius){
    velX *= -1;
    x = width-radius;
  }
  
  //also check in y
  if( y < radius){
    velY *= -1;
    y = radius;
  }else if( y > height-radius){
    velY *= -1;
    y = height - radius;
  }
  
  // calculate distance betweeen target and little ellipse
  float d = dist(x,y,targetX,targetY);
  
}

void keyPressed() {

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

void mousePressed() {

  x = mouseX;
  y = mouseY;
  velX = 0;
  velY = 0;
}

