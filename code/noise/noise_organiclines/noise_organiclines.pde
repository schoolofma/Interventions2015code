float count = 0;

void setup()
{
  size(400,400);
  background(0);
}

void draw()
{
  count += .01;

  //background(255);
  fill(0,0,0,1);
  rect(0,0,width,height);

  for(int i = 0; i < 100; i++)
  {
    
    float x = noise( count, (i/100.))*width;
    float y = noise( (i/100.),count)*height;
    
    noStroke();
    fill(255,255,255,20);
    ellipse( x,y,2,2);
   
    
  }
  
  
  
}

