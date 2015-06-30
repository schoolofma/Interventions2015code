class RotatingRect {
  float x, y;
  float wi, he;
  float angle;
  int theColor;
  
  // 3. The constructor of the object has the same name
  // as the class. Note there's no "void" or othe type at
  // the beginning of the next line.
  // This constructor takes 3 arguments, so when calling "new"
  // we also need to send 3 arguments.
  RotatingRect(float tw, float th, int tcolor) {
    // the next properties are sent as arguments
    wi = tw;
    he = th;
    theColor = tcolor;

    // not every property must be sent as argument.
    // x and y for instance are decided here randomly.
    x = random(width);
    y = random(height);
    angle = random(TWO_PI);
  }
  
  // The next methods will not be called automatically,
  // only when we specifically call these methods for
  // an instance (r1, r2) of the object. 
  
  // a method (functions in objects are called method).
  // When calling changeColor() without arguments it will
  // set a random color for the object.
  void changeColor() {
    theColor = color(random(255), random(255), random(255));
  }
  // Notice we are declaring again changeColor(), this time
  // with one argument. The argument is the color we want to
  // set for this object.
  void changeColor(int tcolor) {
    theColor = tcolor;
  }
  
  // We call paint from draw(), so this method will run 
  // 60 times per second. It doesn't have to be called paint(),
  // it could be called draw, or something else.
  void paint() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    fill(theColor);
    rect(0, 0, wi, he);
    popMatrix();
    angle = angle + 0.1;
  }
}

