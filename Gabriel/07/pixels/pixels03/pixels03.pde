PImage pattern;

int sz=10;

 

void setup() {

  size(1920, 1000);
  
  background(0);

  pattern= loadImage("TRAINGLE_PATTERN.jpg");
}


void draw() {
  
 // for(int i = 0; i<10000; i++){
  
  

  //1: get total numbers of pixels and save in a variabe


  int totalPixels= pattern.width * pattern.height;


  //2: calculate a random position in the array and save as a int variable


  int rd = (int)random(totalPixels);



  //3: load image pixels and store color value at random position in a color variabe

  pattern.loadPixels();
  color c = pattern.pixels[rd];

  //4: calculate the position of the index with formulas:

  int x = rd % pattern.width;
  int y= (rd - x)/pattern.width;
  
  
  sz++;
  if(sz==900){sz=sz*-1;
 }
  


  //5: fill with color variable

  fill(c,random(50,100));


  //6: draw triangle or ellipse using x and y;

  strokeWeight(2);
  stroke(0);
  ellipse(x, y, sz, sz);
  

}


