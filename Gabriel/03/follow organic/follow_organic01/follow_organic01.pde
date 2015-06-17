//translate to center of screemn
//draw rectangle
float x;
float y;

float x1;
float y1;

float x2;
float y2;

PImage fish;
PImage bg;


float posx;
float posy;



float bubbley;




void setup() {
  size(1920, 1080);

  x = width/2;
  y = height/2;
  
  x1 = 0;
  y1 = 0;
  
  fish=loadImage("fish.png");
  
  bg=loadImage("undewater.jpg");
  
  bubbley=1080;
  
  posx=random(-1920/2, 1920/2);
  
  
  
}

void draw() {
  
  imageMode(CORNERS);
  image(bg,0,0);
  

  //background(0,0,255,0);
  
  
  //image(fish,0,0,fish.width*.5, fish.height*.5);
  
  //atan2(y,x);

  float angle = atan2(mouseY - y, mouseX- x); 
  
   float angle2 = atan2(mouseY - y1, mouseX- x1); 

  x= x + .05*(mouseX-x);
  y= y + .05*(mouseY-y);
  
  x1= x1 + .1*(mouseX-x1);
  y1= y1 + .1*(mouseY-y1);
  
  
  
  
  bubbley=bubbley-2;
  pushMatrix();
  translate(width/2,height/2);
  noStroke();
  fill(#CEEFFF, 80);
  ellipse(0,bubbley,20,20);
  ellipse(-100,bubbley*.7,20,20);
  ellipse(100,bubbley*.5,20,20);
  ellipse(-200,bubbley*.9,20,20);
  ellipse(200,bubbley*.4,20,20);
  ellipse(220,bubbley*.4,20,20);
  ellipse(-300,bubbley*.4,20,20);
  ellipse(400,bubbley*.2,20,20);
  ellipse(-250,bubbley*.1,20,20);
  ellipse(300,bubbley*.1,20,20);
  ellipse(-400,bubbley*.12,20,20);
  popMatrix();
  

  
  



  pushMatrix();

  translate (x, y);
  rotate(angle+PI);
  //rect(0, 0, 70, 70);
  imageMode(CENTER);
  image(fish,0,0,fish.width*.5, fish.height*.5);
  
  
  popMatrix();
  
  pushMatrix();
  
  
   translate (x1, y1);
   rotate(angle2+PI);
   image(fish,0,10,fish.width*.2, fish.height*.2  );
  //rect(0, 0, 40, 40);

  popMatrix();
}

