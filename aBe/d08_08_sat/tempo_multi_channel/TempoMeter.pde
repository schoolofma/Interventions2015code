class TempoMeter {
  // Here we store the times of events. For instance key presses in this example.
  IntList events;

  // This is the amount of time used for averaging. 5000 means 5 seconds.
  int maxPeriod = 5000;
  
  float eventRate = 0;
  float smoothedRate = 0;

  TempoMeter() {
    // Initialize the container where we store events.
    events = new IntList();
  }
  
  void event() {
    events.append(millis());
  }

  void update() {
    // While we have events, if the events are too old, remove them 
    while (events.size () > 0 && millis() > events.get(0) + maxPeriod) {
      events.remove(0);
    }

    // calculate the current rate event (in events per second)
    eventRate = events.size() * 1000.0 / maxPeriod;

    // lerp is used here for "easing" (smooth interpolation between currentY and targetY)
    // it means "move 0.03% from currentY towards targetY"
    smoothedRate = lerp(smoothedRate, eventRate, 0.1);
  }
}

