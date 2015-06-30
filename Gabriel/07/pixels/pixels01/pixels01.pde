void setup() {
  
  size (1920/2,1000);
  
  
}



void draw() {
  
  // get total pixels in window
  
  int totalPixels = width * height;
  
  //tell p5 we want to access the pixel array
  
  loadPixels();
  //loop through all te pixels
  
  for(int i = 0; i<totalPixels/2; i++){
   // change the color of the pixel
   color c = color (random(255), random(255), random(255) );
   pixels[i] = c;
   
  }
  
  //update de pixels array
  
  updatePixels(); 
  





}
