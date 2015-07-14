void draw() {
  // normalized values are in the range 0 .. 1
  
  // always working in the range 0 .. 1 makes things easier,
  // because you have less things to agree on.
  
  // in real life, measurements have different ranges:
  // age might be between 0 and 100, 
  // bicycle speed between 0 and 60 km/h
  // temperature between -40 and 60, etc
  
  // if we normalize all these values, they would be numbers
  // in the range 0 to 1.
  
  // normalizing the mouse position:
  float normX = norm(mouseX, 0, width);
  
  // ... here we would send the normalized X via OSC ...
  
  
  
  // later, when we receive a normalized value, we can revert 
  // the normalization by multiplying by width. 
  println(normX * width);  
  
  // or like this:
  
  ellipse(normX * width, normY * height, 20, 20);
}
