// create a PImage called img
PImage photo; 

void setup () {
  size (593, 604);

  //load image file into yout PImage
  photo = loadImage ("1937168_1209202784583_1166801_n.jpg");

  //image (photo, 0, 0, 593, 604);
}

void draw () {
  photo.loadPixels (); 
  // 1: get total number of pixels and save in variable
  int totalPixels = photo.width*photo.height;

  // 2: calculate a random position in the array and save as an int variable
  int index =  int (random(totalPixels));

  // 3: store color value at the random position in a color variable
  color c = photo.pixels[index];

  // 4: calculate the position of the index with formulas:
  // float x= index % photo.width;
  // float y= (index - x) / photo.width;

  float x= index % photo.width;
  float y= (index - x) / photo.width;

  // 5: fill with color varibale


  // 6: draw triangle or ellipse using x and y
  
  noStroke();
  fill (c);
  ellipse(x, y, 7, 7);
}