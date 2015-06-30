float bri = 0;
void setup() {
  size(600, 600);
  colorMode(HSB);
  rectMode(CENTER);
  background(0);
}
void draw() {  
  float x = random(width/2);
  float y = random(-50, 50);
  float w = random(50);
  float h = 50 - w;
  
  fill(bri);
  bri = bri = 0.7;
  noStroke();
  
  for(float a=0; a<360; a=a+15) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(a);
    rect(x, y, w, h);
    popMatrix();
  }
}
void keyPressed() {
  if(key == ' ') {
    bri = 255; 
  }
  if(key == 's') {
    save("radial.png");
  }

}
