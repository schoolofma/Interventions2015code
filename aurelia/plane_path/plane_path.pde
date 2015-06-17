//GLOBAL
float x;
float y;

PImage plane;
PImage planebroken;
PImage map;
PImage clouds;
int mode = 0;

float cloudx;
float cloudx2;


//global variables apply to all, e.g. when needing to know + use over time

//LOCAL-once
void setup () {
  size (600, 600);
  x = width/2;
  y = height/2;
  

  plane = loadImage("airplane_bg-02.png");
  planebroken = loadImage("airplane_bg-03.png");
  map = loadImage("airplane_bg-01.png");
  clouds = loadImage("clouds.png");

  cloudx = 0;
  cloudx2 = clouds.width*2;
}

//LOCAL-as defined inside a function or if statement

void draw() {

  background(255);
  imageMode(CORNER);
  tint(60, 60, 255, 100);
  image(map, 0, 0, map.width, map.height);
  //
  tint(255);
  //to draw images-name, position, can also add size)

  //imageMode(CENTER);
  //image(plane,0,0,plane.width*.25,plane.height*.25);


  //useful in games, when needing something to rotate towards a target)
  //atan2(); to calculated an angle, on eof the only functions
  //that calauclate y before x, caluclating the difference
  float angle = atan2(mouseY - y, mouseX - x);
  float d = dist(mouseX, mouseY, x, y);
  x = x + .01*(mouseX - x);
  y = y + .01*(mouseY - y);
  
  // if distance to corner 0,0 is less than 5, mode = 1
  if( d < 50 ){  mode = 1; }
    if( d > 50 ){  mode = 0; }


  
  pushMatrix();
  //translate(width/2,height/2);
  translate(x, y);
  rotate(angle+PI/2);


  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  //shadow

  if (mode == 0) {
    //image(plane)
    tint(60, 60, 25, 40);
    image(plane, 20, 20, plane.width*.75, plane.height*.75);
    //plane
    tint(60, 60, 25, 255);
    image(plane, 0, 0, plane.width, plane.height);
  } else if (mode == 1) {
    //image(planebroken)
    tint(60, 60, 25, 40);
    image(planebroken, 20, 20, plane.width*.75, plane.height*.75);
    //plane
    tint(60, 60, 25, 255);
    image(planebroken, 0, 0, plane.width, plane.height);
  }



  //rect(0, 0, 100, 95);
  //translate(x+plane*.25, y+plane*.25);
  //image(clouds, 0, 0, plane.width*.25, plane.height*.25);
  popMatrix();

//clouds
  if (cloudx < -clouds.width*2) {
    //cloudx=width+clouds.width;
    cloudx = cloudx2+clouds.width*2;
  }
  if (cloudx2 < -clouds.width*2) {
    //cloudx=width+clouds.width;
    cloudx2 = cloudx+clouds.width*2;
  }
  
  imageMode(CORNER);
  tint(60, 60, 25, 80);
  image(clouds, cloudx, -10, clouds.width*2, clouds.height*2);
  image(clouds, cloudx2, -10, clouds.width*2, clouds.height*2);
  cloudx=cloudx-2;
  cloudx2=cloudx2-2;

//paddles
  noStroke();
  fill(50, 50, 155, 75);
  rect(mouseX, 0, 150, 30);

  noStroke();
  fill(50, 50, 155, 75);
  rect(mouseX, height, 150, 30);

  noStroke();
  fill(50, 50, 155, 75);
  rect(width, mouseY, 30, 150);

  noStroke();
  fill(50, 50, 155);
  rect(0, mouseY, 30, 150);
}


void keyPressed(){
  if(key == '1') mode = 0;
  else if(key == '2') mode = 1;
  
}