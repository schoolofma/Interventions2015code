
float v1 = 0;
float v2 = 0;
float v3 = 0;

void setup() {

  size (600, 600);
}


void draw () {



  background (random(0,255), 2, 100);
  //fill();
  noFill();

  ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
  //ellipseMode(CENTER);  // Set ellipseMode to RADIUS
  //ellipseMode(CORNER);  // Set ellipseMode to RADIUS
  //ellipseMode(CORNERS);  // Set ellipseMode to RADIUS
  ellipse (width/2, height/2, 250, 280);

  //ojo1
  ellipse (180, 250, 50, 30);
  //ellipse (180, 250, 20, 20);
    ellipse (random(160,190), 250, 20, 20);


  //ojo2
  ellipse (410, 250, 50, 30);
 // ellipse (410, 250, 20, 20);
    ellipse (random(390, 420), 250, 20, 20);

  //nariz
  //arc(width/2, 300, 50, 50, HALF_PI, 3*HALF_PI);
    arc(width/2, 300, random(30,50), 50, 0,PI);

  ellipse (410, 250, 50, 30);

//
  ellipse (180, 250, 50, 30);



  //translate ();


  //border color 
  stroke(#F7D35A);
  //stroke weight

  strokeWeight(5);

  //noStroke();

  //rect();

  //ellipse();

//mouth
ellipse(width/2, random(430,460),30,5);
  ellipse (width/2, 450, 60, 30);



  arc(100, 300, 50, 50, HALF_PI, 3*HALF_PI);


  arc(500, 300, 50, 50, 3*HALF_PI, 5*HALF_PI);

  noFill();
  /*arc(50, 55, 60, 60, HALF_PI, PI);
   arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
   arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);*/
   
       println(frameCount);

 
}


void keyPressed(){
  

if (key == 's'){

save("face1.jpg");
}
}



