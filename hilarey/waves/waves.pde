import processing.video.*;

//Capture video;
Movie video;

//create a float vx and vvy variables for position of ellipse we will draw later
float vx;
float vy;

float xDir = 1;
float yDir = 1;

void setup(){
  size(600, 400);
  
  video = new Movie(this, "IMG_3857.mov");
  video.play();
  video.loop();
  
  vx = video.width/2;
  vy = video.height/2;
}
  
  void movieEvent(Movie c) {
    c.read();
  }
  
  void draw(){
    
    //image(video, 0, 0);
    video.loadPixels();
    
    int x = video.width / 2; 
    int y = video.height / 2;
    
    int index = x + y * video.width;
    
    //color variable for the color value from pixels at your index position
    color c = color(0);
    if(video.width > 0) c = video.pixels[index];
    
    
    
    float bright = brightness(c);
    
    
    float angle = map(bright, 0, 255, 0, TWO_PI);
    vx+= 2*cos(angle)* xDir;
    vy+= 2*sin(angle)* yDir;
    println(angle);
    
    fill(c);
    noStroke();
    rect(vx, vy, 150, 10);
    rectMode(CENTER);
    
    
 if(vx < 15){
   //vx=width;
   xDir *= -1;
   vx=15;
 }else if(vx > width-15){
   //vx = 0;
   xDir *= -1;
 }
 
  if(vy < 15){
   //vy=height;
   yDir *= -1;
   vy=15;
 }else if(vy > height-15){
   //vy = 0;
   yDir *= -1;
 }
 
  }
