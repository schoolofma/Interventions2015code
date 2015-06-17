float x;

void setup(){
  size(600,600);
  frameRate(5);
}
void draw(){
  line(0,0,x,height);
  x=x+5;
  
}
