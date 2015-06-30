void setup () {
  size(600, 600);
  background (255);
  // colimns
  {for (int x=0; x<width; x=x +50) {
    line( x, 0, x, height);

    //rows 
    for (int y=0; y< height; y= y+ 50) {
      ellipse (x, y, 20, 20 );
    }
  }
}
}