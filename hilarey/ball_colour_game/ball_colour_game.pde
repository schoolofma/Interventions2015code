float x = 0;
float y = 0;
float velX = 10;
float velY = 10;
float damping = 0.01;
int radius = 10;

float targetX = 0;
float targetY = 0;
float targetRadius = 30;
float shrinkRadius = targetRadius - 5;
color c = color(255);

void setup(){
 size(300, 300); 
 background(255);
}

void draw(){
   background(255);

x += velX;
y += velY;

//gravity
velY += .08;
//vel reduces over time
velX -= damping *velX;
velY -= damping *velY;


// bounce off walls using velX *= -1 and velY *= -1 and stay inside

if(x < radius){
   velX *= -1;
   x = radius;
 }else if(x > width-radius){
   velX *= -1;
   x= width - radius;
 }
 
  if(y < radius){
   velY *= -1;
   y = radius;
 }else if(y > height-radius){
   velY *= -1;
   y= height - radius;
 }
 
 // calculate distance between target and little ellipse
 float d = dist(x, y, targetX, targetY);
 
 if(d < shrinkRadius+radius){
   // do something!!
   targetX = random(width);
   targetY = random(height);
   c = color(random(0,255), random(0,255), random(0,255));
  // fill(random(0,255), random(0,255), random(0,255));
   velX *= -1;
   velY *= -1;
   shrinkRadius -= 1;
 }
 fill(c);
 ellipse(x, y, radius*2, radius*2);

 // draw target circle
  fill(255);
ellipse(targetX, targetY, shrinkRadius*2, shrinkRadius*2);
 
  }


void keyPressed() {
  
  //add in other arrow keys
  
  if(key == CODED){
    if(keyCode == RIGHT) {
      velX += 2;
    }
  else if (keyCode == LEFT) {
      velX += -2;
    }
  else if(keyCode == UP) {
      velY += -2;
  }
      
  else if(keyCode == DOWN) {
      velY += +2;
    }
    }
    
  }
