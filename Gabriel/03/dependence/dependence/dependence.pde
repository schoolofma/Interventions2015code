float scale;
float scaleNeg;
int mode = 0;

void setup () {
  
  size(1280,720);
  background(0);
  
   scale= 150;
   scaleNeg=-150;
  
}  
  
void draw () {
  
  background(0);
  if(scale < 1000 && mode == 0){scale=scale+10;}
  else if( scale > 0 && mode == 1){scale=scale-10;
  }
  
  scaleNeg=1000-scale;
  
 // if(scale==1000 && mode==1){scale=scale+10;}
 // else if
  
  
   // if scale is equal to 1000 set mode to 1
   // if scale equals 0 set mode to 0
   
   
  
  
  println(scaleNeg);
  println(scale);
 


  translate(width/2,height/2);
  noStroke();
  
  
  ellipse(-200,0,scale,scale);
  
  
  ellipse(200,0,scaleNeg,scaleNeg);
  
  
  
  
  
  
  
}
