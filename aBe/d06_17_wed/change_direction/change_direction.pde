float x;
float mov = 1;

void draw() {
  ellipse(x, 20, 20, 20);
  x = x + mov;
}
void mousePressed() {
  // Here we flip the sign of mov.
  // If it was positive (going right) it becomes
  // negative (going left).
  mov = -mov;
}
void keyPressed() {
  if(key == 's') {
    save("change_dir.jpg");
  }
}
