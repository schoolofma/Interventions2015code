int nextEvent = 0;

void setup() {
  size(400, 400);

  nextEvent = millis() + 200;
}


void draw() {
  ellipse(random(width), random(height), 20, 20);
  
  
  if(millis() > nextEvent) {
    // read
    background(random(255));
    nextEvent = millis() + 200;
  }
}
