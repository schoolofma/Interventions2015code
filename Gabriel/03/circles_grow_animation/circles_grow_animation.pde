
float scale;
float r,g,b;
float w,h;
float txt;

void setup () {
  size(1280,720);
background(0);
scale= frameCount;
r=0;
g=0;
b=0;

w=width/2;
h=height/2;

txt=50;

   

}

void draw() {
  
 
  
  //background(0);
  
  fill(0,0,0,50);
  noStroke();
  ellipse(w +15, h+20, scale, scale);
  scale=scale+5;
 
   scale=scale+5;
  fill(r,g,b);
  noStroke();
  ellipse(w, h, scale, scale);
 
  
  textSize(txt+2);
  translate(0,0);
  fill(0,0,0,20);
  textAlign(CENTER, CENTER);

  text("PERCEPTION",w+15,h+15);
  
  
  textSize(txt*2);
  translate(0,0);
  fill(255,255,255,100);
  textAlign(CENTER, CENTER);

  text("PERCEPTION",w,h);
  
   
  
  }

void keyPressed() {
  if(key=='s') {
    scale=random(0,500)+10;}
    
    if(key=='s'){
       r=random(255);
       g=random(255);
       b=random(255);
       
       if(key=='s') {
    txt=random(0,500);}
    }
    
     if(key=='a') {
       r=0;
       g=0;
       b=0;
     }
    
    
  

}
  
  
