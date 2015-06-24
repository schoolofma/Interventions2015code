//declare an integer array without setting values but telling how many indexes it will have

int[] allX = new int [100];
int[] allY = new int [100];
color [] clr = new color[100];

void setup () {
  size (600, 600);
  
  background(#FFFFFF);

  // loop through all the indexes and give each a random value

  for (int i = 0; i < allX.length; i++) {
    

    allX[i] = (int)random(width);
    allY[i] = (int)random(height);
    clr [i] = color (random(255), random(255), random(255) );
  }
}

void draw () {
  
noStroke();
  fill(256, 255, 50);
  for (int i=0; i<1000; i=i+1);
    rect  (random (width), random(height), 2, 2);

  // loop through indexes of array and draw circles ar each x pos
  // i+ is the same as i = i+1
  
  for (int i=0; i < allX.length; i++) {
    fill (clr[i]);
    ellipse (allX[i], allY[i], 20, 20);
  }
}

