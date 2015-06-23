void setup() {
  size(600, 600);
  background(255);
  
  // columns
  for(int x=100; x<width-100; x = x + 50) {
    
    // rows
    for(int y=100; y<height-100; y = y + 50) {
      
      // 50% probability
      if(random(100) < 50) {
        ellipse(x, y, 20, 20);
      }
    }
  }  
  save("probability_grid.png");
}
