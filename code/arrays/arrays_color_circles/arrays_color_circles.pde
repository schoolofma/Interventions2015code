// create some arrays for position and color
int [] xp = new int[30];
int [] yp = new int[30];
color [] c = new color[30];

void setup() {
  size(300, 300);
  
  // set values of arrays to be random numbers
  for (int i = 0; i < 30; i++) {
    xp[i] = (int)random(width);
    yp[i] = (int)random(height);
    c[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  
  background(0);
  
  // draw ellipses
  for (int i = 0; i < 30; i++) {
    fill(c[i]);
    ellipse(xp[i], yp[i], 40, 40);
  }

  // calculate closeness to mouse and change colors
  for (int i = 0; i < 30; i++) {
    float d = dist(xp[i], yp[i], mouseX, mouseY);
    if (d < 30) { 
      c[i] = color(random(255), random(255), random(255));
    }
  }
}


