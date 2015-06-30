// 1. Program starts here, reserving space for two variables
// of type "RotatingRect". So far is just the space, the
// objects don't exist yet.
RotatingRect r1;
RotatingRect r2;

void setup() {
  // 2. Processing calls setup automatically when the program
  // starts. Then we create two instances of RotatingRect.
  // When creating each instance, we send 3 arguments, to
  // specify the look or behavior of each. In this case
  // we just set width, height and color.
  // When calling "new xxx" the code jumps to the constructor
  // of the object.
  r1 = new RotatingRect(100, 10, #FF0000);
  r2 = new RotatingRect(50, 50, #09F599);
  // after this point r1 and r2 are initialized.
}

// draw() is called 60 times per second
void draw(){
  background(200);
  // Call here a method on each object 
  r1.paint();
  r2.paint();
}

void mousePressed() {
  // Call the changeColor() method when the mouse is clicked.
  r1.changeColor();
  r2.changeColor(#00FF00);
}
