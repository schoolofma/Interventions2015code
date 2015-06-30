// this runs one time
void setup() {
  size(600, 600);
}

// this runs at 60 fps
void draw() {
  rect(random(600), 281, 20, 20);
}

void keyPressed() {
  if(key == 's') {
    save("animation_frame.jpg");
  }
}
