float hu = 0;
void setup() {
  size(600, 600);
  colorMode(HSB);
}

void draw() {
  
  //background(0);
  
  fill(0, 5);
  rect(0, 0, width, height);
  
  translate(width/2, height/2);
  rotate(frameCount * 0.01);
  strokeWeight(5);
  stroke(hu, 255, 255);
  line(0, 0, 1000, 0);
}
void keyPressed() {
  if(key == ' ') {
    hu = random(255);
  }
  if(key == 's') {
    save("rainbow_radar.jpg");
  }
}
