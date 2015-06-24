void setup() {
  size (500, 500);
}

void draw () {
  background (#E3D9B5);


    for (int sz= 100; sz>0; sz = sz - 100) {
      noStroke 
    fill (#99D8D7);
    ellipse (width/2, height/2, sz, sz);
  }
}