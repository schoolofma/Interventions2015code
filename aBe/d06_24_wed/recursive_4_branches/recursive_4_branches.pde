void magicRect(float x, float y, float wi, float he, float bri) {
  
  if( wi > 2) {
    fill(bri);
    rect(x, y, wi, he);
    
    float newx, newy, newwi, newhe, newbri;
    
    newx = x + wi * random(0.8, 1.0);
    newy = y;
    newwi = wi/2;
    newhe = he/2;
    newbri = bri * random(0.7, 0.9);
    magicRect(newx, newy, newwi, newhe, newbri);
    
    newx = x - wi * random(0.8, 1.0);
    newy = y;
    newwi = wi/2;
    newhe = he/2;
    newbri = bri * random(0.7, 0.9);
    magicRect(newx, newy, newwi, newhe, newbri);
        
    newx = x;
    newy = y + he * random(0.8, 1.0);
    newwi = wi/2;
    newhe = he/2;
    newbri = bri * random(0.7, 0.9);
    magicRect(newx, newy, newwi, newhe, newbri);

    
    newx = x;
    newy = y - he * random(0.8, 1.0);
    newwi = wi/2;
    newhe = he/2;
    newbri = bri * random(0.7, 0.9);
    magicRect(newx, newy, newwi, newhe, newbri);

  }
}

void setup() {
  size(600, 600);
  background(0);
  rectMode(CENTER);
  noStroke();
  magicRect(200, 200, 200, 200, 255);
}

void draw() {
}

