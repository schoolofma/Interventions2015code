PImage img;

void setup() {
  img =loadImage("1catlady.jpg");
  size(img.width, img.height);
  background(255);
}

void draw() {
  //repeats everydraw 100 within the for()
  for(int i=0;i<100;i++){
  //1. get total numner of pixels and save in a variable
  int totalpixels =img.width*img.height;
  //2. calculate a reandom position in the array and save as an int varibale
  int index=(int)random( 0, totalpixels);
  //3. load img pixels 
  img.loadPixels();//get pixels array access
  //and store color value at the random posotion in a colour variable
  
  color c = img.pixels[index];
  //4. calculate the postition of the index with formulas:
  
  float x=index%img.width;
  float y= (index-x)/img.width;
  
  //5. fill with colour variable
  fill(c);
  
  
  //6.draw triangle or ellipse using x and y
  

  noStroke();
  ellipse (x,y,20,20);
  
  //triangle(x*4, y*4, x*12, y*12, x*6, y*6);
  }
}

