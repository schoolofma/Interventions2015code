void magicRect(float x, float y, float wi, float he) {
  
  if( wi > 2) {
    fill(random(255), random(255), random(255));
    rect(x, y, wi, he);
    
    magicRect(x + wi/2, y, wi/2, he/2);
    magicRect(x, y + he/2, wi/2, he/2);
  }
}

void setup() {
  size(600, 600);
  background(0);
  rectMode(CENTER);
  noStroke();

  magicRect(40, 40, 30, 30);
  magicRect(100, 40, 30, 30);
  magicRect(200, 200, 200, 200);
}

void draw() {
}

