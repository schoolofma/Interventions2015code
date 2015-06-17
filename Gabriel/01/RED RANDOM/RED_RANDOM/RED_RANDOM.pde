void setup (){
  size (1280, 720);
  background(0);
}

void draw (){
   

  
  
  fill(255,255,255, random(100));
ellipse(0,0, random(300), random(300));

fill(255,255,255, random(100));
ellipse(1280,0, random(300), random(300));



  
  fill(0,10);
  rect(0,0, width, height);

translate(width/2, height/2);

fill(255,0,0, random(100));
ellipse(0,0, random(700), random(700));

fill(255,255,255, random(100));
ellipse(0,0, random(300), random(300));





}