void setup() {
  size(500, 600);
  noStroke();
}
void draw() {
  if(mousePressed) {
    fill(random(200));
    ellipse(width/2, height/2, random(200), random(200));
  }
}
void keyPressed() {
  if(key == 's') {
    save("godzilla.png");
  }
}
