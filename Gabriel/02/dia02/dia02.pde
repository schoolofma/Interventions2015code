void setup() {
  size(1280,720);
  background(#E35B00);
}

void draw() {
  
  if(mousePressed) {
  
  fill(255,255,255, 0);
  ellipse(mouseX, mouseY, 55, 55);


} else{
  
  fill(random(40,180),80,random(100));
 
}
  
  translate(mouseX, mouseY);
  rotate(random(360));
  
  triangle(30, 75, 58, 20, 86, 75);


  
 
}
