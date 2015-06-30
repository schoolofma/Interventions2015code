void setup() {
  size(600, 600);  
}

void draw() {
  background(255);

  fill(0);
  textSize(100);

  // During the first 100 frames show this text
  if(frameCount < 100) {
    text("hi SoMA", 20, height);
  }
  
  // If the current frame number is between 200 and 300
  // show a different text.
  
  // In English you would write: "if frameCount is
  // between 200 and 300, do this" but when programming
  // you must write "if frameCount is larger than 200
  // and framecount is smaller than 300, do this"

  // && means AND, so both conditions must be true.
  if(frameCount > 200 && frameCount < 300) {
    text("...time passing...", 20, 220);
  }
}

void keyPressed() {
  if(key == 's') {
    save("time.png");
  }
}
