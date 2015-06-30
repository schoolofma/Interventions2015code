void setup() {
  size(600, 600);  
  background(#259367);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  
  for(int a = 0; a<360; a = a + 30) {
    pushMatrix();
    rotate(radians(a));
    
    rect(20, 20, 200, 20);
    ellipse(200, 0, 20, 20);
    popMatrix();
  }
 
}
void keyPressed() {
  if(key == 's') {
    save("radial_symmetry.png");
  }
}
