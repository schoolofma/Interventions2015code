float r;

void setup() {
  size(1280,720);
}

void draw() {

  background(0);

  r = r+1;

  for (int x=25; x<width+50; x=x+50) {
    for (int y=25; y<height+50; y=y+50) {
      stroke(255);
      strokeWeight(2);
      noFill();
      //fill(255, 0, x);
      pushMatrix();
      translate(x, y);
      rotate(r/5);
      noStroke();
      fill(255,0,0);
      ellipse(0, 0, random(110), random(150));
       stroke(255);
      noFill();
      ellipse(25, 25, 1, 1);
      pushMatrix();
      rotate(-r/2);
      
      fill(255,255,255);
      ellipse(50, 50, 10, 10);
      popMatrix();

      popMatrix();
    }
  }
}

