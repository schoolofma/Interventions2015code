// create a PImage called img //<>//
PImage photo; 

void setup () {
  size (593, 604);

  //load image file into yout PImage
  photo = loadImage ("1937168_1209202784583_1166801_n.jpg");

  //image (photo, 0, 0, 593, 604);
}

void draw () {

  photo.loadPixels (); // get pixels array access

  // loop trough every other pixel in the x and y directions and get the color info
  for (int x=0; x< photo.width; x+=3) {

    for ( int y = 0; y < photo.height; y+=3) {

      // get our index in the pixel array
      int index = y * photo.width + x;

      // get the color at picture index
      color c = photo.pixels[index];

      // use fill to set the color and then draw an ellipse at x, y

      fill (c);
      ellipse(x, y, 3, 3);
    }
  }
}