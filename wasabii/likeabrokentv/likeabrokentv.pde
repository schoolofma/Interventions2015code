//to repeat
void setup() {
  size(600, 600);
  background(255);
  for (int x=0; x<width; x=x+5) {
    line(0, 0, x, height);

  
  }
    strokeWeight(5);
    for (int x=0; x<width; x=x+5)
    {

      stroke(x/3);
      line(width, height, x, 0);
    }
}

/*void draw() {
 
 noStroke();
 fill(random(256));
 //set condition--whats the codition that gets it going-- equation to get it going
 //repeat loop flow for(a;b;c)
 for (int i=0; i<1000;i=i+1){
 rect(random(width),random(height),2,2);}
 
 }
 */

