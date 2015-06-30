// declare an ArrayList of type SpinningFan
ArrayList<SpinningFan> fans;

void setup() {
  size(300, 300);

  // initialize the ArrayList (it is empty at start)
  fans = new ArrayList<SpinningFan>();

  // add a SpinningFan object to ArrayList fans
  fans.add( new SpinningFan(100, 100) );
}

void draw() {
  background(0);

  // loop through all elements in ArrayList fans
  for (int i = 0; i < fans.size (); i++) {

    // make temporary object for each element at position i
    SpinningFan f = fans.get(i);
    f.display();
  }
}


void mousePressed() {
  // when mouse is pressed, add object to ArrayList at mouse position
  fans.add( new SpinningFan(mouseX, mouseY) );
}

void keyPressed() {

  // pick a random object from the ArrayList and remove it
  if ( fans.size() > 0 ) {
    int randIndex = (int)random( fans.size() );
    // remove it!!!!!
    fans.remove( randIndex );
  }
  
}




