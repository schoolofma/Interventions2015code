float angle;
float angle2;
float dist = 0;


void setup (){
size (600, 600);
background(255);
noStroke();
fill(0);
colorMode (HSB);
}

void draw () {
  
  
   angle = angle + 0.03;
   angle2 = angle2 + 0.03;
   dist = dist + 0.06;
   
   translate(width/2, height/2);
   
   //large circular motion
   float x = dist * cos(angle);
   float y = dist * sin(angle);
   
   ellipse (x , y, 10, 10);
   noStroke();
   fill (frameCount %256 ,255, 255);

   
}