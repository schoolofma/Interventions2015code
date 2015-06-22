
PImage pattern;

int stepSize = 1;

float sz = 10;

void setup() {

  size(1920/2, 900);
  
  

  //load image file into your PImage


  pattern= loadImage("TRAINGLE_PATTERN.jpg");
}




void draw() {
  
  sz+= stepSize*0.5; 
  
  if(sz == 50|| sz == 0) {stepSize *=-1;
  }
  println(sz);
  background(0);
  
  pattern.loadPixels();

  //image (pattern, 0, 0);

  //loop through every other pixel in x and y directions and get the color info


  for (int x = 0; x< pattern.width; x+=50) {

    for (int y = 0; 
    y<pattern.height; 
    y+=50) {

      //get our index in the pixel array

      int index= y * pattern.width + x;
      
      // get the color at pixel index
      
      color c = pattern.pixels[index];
      
      //use fill to set the color and then draw an ellipse at x,y
      
      
      
      
      
      fill(c);
      rect(x,y,sz,sz);
      rectMode(CENTER);
      
      
    }
  }
  
  
   
}

