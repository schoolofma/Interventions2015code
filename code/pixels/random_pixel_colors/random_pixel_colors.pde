
void setup(){
  size(200,100);
}


void draw(){
    // get total pixels in window
    int totalPixels = width * height;
    // tell p5 we want to access the pixel array
    loadPixels();
    
    // loop through all the pixels
    for(int i = 0; i < totalPixels; i++){
      // create a random color
      color c = color( random(255), random(255), random(255) );
      // set the color of the pixel
      pixels[i] = c;
    }
    
    // update the pixels array
    updatePixels();
}





