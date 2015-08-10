

//interface vars
Fan[][] fans;
int rows, cols;
int col, row; //used to draw red rectangles on screen



//turn debugging messages on or off
boolean debug = true;

void setup() {
  size(600, 600);

  //interface vars

  rows = 3;
  cols = 3;
  fans = new Fan[rows][cols];
  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      fans[i][j] = new Fan(i, j); // play w/ these: spaced out by 20, offset by 100
    }
  }
}

void draw() {
  //draw grid
  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      fans[i][j].display();
      fans[i][j].update();


      fans[i][j].shuffleMode();
    }
  }
}



//ADDED
void shuffleMode() { 
  //for (int j=0; j<cols; j++) {
  //  for (int i=0; i<rows; i++) {
  //    Fan thisFan = fans[i][j];
  //    if (cols==j && rows ==i) { 
  //      thisFan.startSpinning();
  //    }
  //  }
  //}
  //}
  //
  for (int j=0; j<cols; j++) {
    for (int i=0; i<rows; i++) {
      col= j;
      row=i;
      Fan thisFan = fans[i][j];
      if (col==j && row ==i) {
        thisFan.startSpinning();
      }
    }
  }
}