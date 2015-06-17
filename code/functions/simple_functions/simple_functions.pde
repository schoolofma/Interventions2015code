
void setup(){
  size(300,300);
}


void draw(){
  
}

void mousePressed(){
  drawFadeCircle(mouseX,mouseY);
}

void drawFadeCircle(int x, int y){
  noStroke();
  for(int i = 0; i < 6; i++){
    fill(255,255,255,255 - (10 + i*40) );
    ellipse(x,y,10*i,10*i);
  }
}


