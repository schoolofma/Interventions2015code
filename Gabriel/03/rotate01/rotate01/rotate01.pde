
float angle=0;

void setup () {
   size(300,300);
   
}

void draw () {
  
  background(0);
  angle=angle+.01;
  
  pushMatrix();
  
  noStroke();
  translate(width/2,height/2);
  rotate(angle);
  
  fill(255,0,0);
  
  rect(0,0,30,30);
  
  fill(255,255,0);
  ellipse(0,0,50,50);
  
  translate(25,25);
  
  fill(255,0,255);


  ellipse(0,0,25,25);
  
  popMatrix();
  

  
  
 
  
}
