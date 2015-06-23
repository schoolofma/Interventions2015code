void setup() {
  size(600, 600);
}

void draw() {
  background(#18AD28);

  noStroke();
  fill(#EDB294);
  rect(40, 40, 200, 200);

  fill(#FFFFFF);
  rect(70, 86, 68, 74);

  fill(#FFFFFF);
  rect(164, 87, 70, 71);

  fill(#000000);
  rect(81, 103, 60, 46);

  fill(#000000);
  rect(185, 100, 52, 54);
}
void keyPressed() {
  if(key == 's') {
    save("face.jpg");
  }
}
