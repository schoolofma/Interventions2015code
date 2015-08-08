// Here we store the times of events. For instance key presses in this example.
IntList events;

// This is the amount of time used for averaging. 5000 means 5 seconds.
int maxPeriod = 5000;

// This is just for drawing a line on the screen. It will indicate the current tempo. 
float currentY = 0;

void setup() {
  size(600, 600);
  stroke(255);
  
  // Initialize the container where we store events.
  events = new IntList();
}

void draw() {
  // Call our function to delete old events (older than maxPeriod)
  cleanUpEvents();
  
  background(0);

  // calculate the current rate event (in events per second)
  float eventRate = events.size() * 1000.0 / maxPeriod;
  
  // map the event rate to a vertical position.
  // 0 events per seconds at the bottom of the screen,
  // 20 events per second at the top of the screen
  float targetY = map(eventRate, 0, 20, height, 0);
  
  // lerp is used here for "easing" (smooth interpolation between currentY and targetY)
  // it means "move 0.03% from currentY towards targetY"
  currentY = lerp(currentY, targetY, 0.1);
  
  // Draw a very straight line
  line(0, currentY, width, currentY);
}

// Function to delete old events
void cleanUpEvents() {
  // While we have events, if the events are too old, remove them 
  while (events.size() > 0 && millis() > events.get(0) + maxPeriod) {
    events.remove(0);
    // for debugging
    println("remove event", events.size());
  }
}

void keyPressed() {
  events.append(millis());
  // for debugging
  println("append event", events.size());
}

