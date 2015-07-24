int acounter;
int bcounter;
int ccounter;



void setup() {
  background(0);
  size(600, 600);

  //stroke(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  line(0, 200, width, 200);
  text("a", 70, 220); 
  fill(255);

  textSize(32);
  textAlign(CENTER, CENTER);
  line(0, 300, width,300);
  text("b", 70, 320); 
  fill(255);

  textSize(32);
  textAlign(CENTER, CENTER);
  line(0, 400, width, 400);
  text("c", 70, 420); 
  fill(255);
  
  fill(255, 0, 0);
  noStroke();
  rect(150, 200, 50, 50 );

  fill(0, 255, 0);
  noStroke();
  rect(150, 300, 50, 50 );

  fill(0, 0, 255);
  noStroke();
  rect(150, 400, 50, 50 );
}

void draw() {
  if (keyPressed) {
    if (key == 'a')  {
      acounter++; //same as acounter = acounter +1
    }
    if (key == 'b') {
      bcounter++; //same as acounter = acounter +1
    }
    if (key == 'c') {
      ccounter++; //same as acounter = acounter +1
    }
  }
  fill(255, 0, 0);
  noStroke();
  rect(200, 200, acounter, 50 );

  fill(0, 255, 0);
  noStroke();
  rect(200, 300, bcounter, 50 );

  fill(0, 0, 255);
  noStroke();
  rect(200, 400, ccounter, 50 );
}