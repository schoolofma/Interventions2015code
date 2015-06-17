void setup() {
  size(1280,720);
  background(255);
}

void draw() {
  
  if(mousePressed){

    

float x1 = random(mouseX);
float x2= random(mouseX);
float y1=random(mouseY);
float y2=random(mouseY);

noFill();
line(x1, y1, x2, y2);
ellipse(x1,y1,10,10);
ellipse(x2,y2,10,10);
  }
  
  else{
    
    
float x1 = random(mouseX/3);
float x2= random(mouseX/3);
float y1=random(mouseY/3);
float y2=random(mouseY/3);

fill(255,0,0);
    
line(x1, y1, x2, y2);
ellipse(x1,y1,10,10);
ellipse(x2,y2,10,10);
    }






}
