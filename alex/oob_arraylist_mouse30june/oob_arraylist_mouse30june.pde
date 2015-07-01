// declare an array list

ArrayList<Spinning> fans;

void setup() {
  size(600, 600);
  //initialize the array list empty
  fans = new ArrayList<Spinning>();
  // add Spinning object to ArrayList fans
  fans.add( new Spinning(100, 100, 10, 10));
  // i have to add the number of paramteres de mis constructor
  // (1,2,3,4)
}

void draw() {
  background(255);
  // loop trough all elements in ArrayList fans
  for (int i =0; i < fans.size (); i ++) {
    //make temporary object for each element at position [i]
    Spinning S = fans.get(i);
    S.create();
  }
}

void mousePressed() {
  //when mouse is pressed add an Object from to ArrayList at mouseX, mouseY
  fans.add(new Spinning(mouseX, mouseY, random(100), random(500)));
}


void keyPressed() {
  if (key == 's') {
    save(System.currentTimeMillis()+ ".gif");
  }
  if (fans.size() > 0) {

    int randIndex = (int)random(fans.size());
    fans.remove(randIndex);
  }
}





