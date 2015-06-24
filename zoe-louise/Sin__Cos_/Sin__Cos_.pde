void setup () {
  
  size (600, 600);
}

void draw () {
  
  // sin and cos, always -1 and 1
 // background (255);
 
 float distance1 = 200;
 float angle1 = frameCount * -0.3;
 float x1 = width/2 + distance1 * sin(angle1);
 float y1= height/1 + distance1 * cos(angle1);
 
 float distance2 = 330;
 float angle2 = frameCount * 0.30;
 float x2 = width/1 + distance2 * sin(angle2);
 float y2= height/2 + distance2 * cos(angle2);
 
 float r = 128 + 128 * sin(90 + frameCount * 0.0017);
 float g = 128 + 128 * sin(frameCount * 0.0014);
 float b = 128 + 128 * sin(frameCount * 0.0016);
 

 
 stroke (r, g, b);
 line (x1, y1, x2, y2);
 
 
 float distance3 = 430;
 float angle3 = frameCount * 0.10;
 float x3 = width/1 + distance3 * sin(angle3);
 float y3= height/2 + distance3 * cos(angle3);
 
  stroke (g, r, b);
 line (x3, y3, x2, y2);
 
}