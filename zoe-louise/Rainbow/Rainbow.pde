void setup (){
size (600, 600);
colorMode (HSB);
}

void draw() {
  background (frameCount %256 ,255, 255);
  translate (width/2, height/2);
  rotate(frameCount * 0.01);
  strokeWeight (5);
  stroke (frameCount %256 ,255, 255);
  line (0, 0, 1000, 0);
}