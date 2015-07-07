float x = 0;
PImage img;

void setup() {
  size(540, 540);
  img = loadImage("real-toast.png");
  //background(0);
  noStroke();
  fill(0);
}

void draw() {
  for (int i = 0 ; i < width; i++) {
    stroke(map(i, 0, width, 200, 255));
    line(i, 0, i, height);
  }
//background(#23E483);
//ellipse(x, height/2, 30, 30);
x = x + 40;
tint(255,220);
image(img, x, height/4);

saveFrame("frame####.gif");

if (x > width) {
  noLoop();
}
}

