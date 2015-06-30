int [] posx = {
  100, 130, 170, 220, 275, 325, 365, 395
};

int posY= 100;

int szY = 60;

int [] szX = {
  15, 20, 27, 35
};

int posY_linha02 = posY +90;

int posY_linha03 = posY + 90*2;

int posY_linha04 = posY + 90*3;

int posY_linha05 = posY + 90*4;

int posY_linha06 = posY + 90*5;

int posY_linha07 = posY + 90*6;

int posY_linha08 = posY + 90*7;



void column () {

  pushMatrix();

  for (int i = 0; i<8; i++) {

    //primeira linha

    // ellipse 01




    noStroke();
    fill(0, 0, 255);
    ellipse(posx[0], posY, szX[0], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[0], posY, szX[0], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[0], posY, szX[0], szY, HALF_PI, PI+HALF_PI);



    // ellipse 02

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[1], posY, szX[1], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[1], posY, szX[1], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[1], posY, szX[1], szY, HALF_PI, PI+HALF_PI);


    // ellipse 03

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[2], posY, szX[2], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[2], posY, szX[2], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[2], posY, szX[2], szY, HALF_PI, PI+HALF_PI);


    // ellipse 04

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[3], posY, szX[3], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[3], posY, szX[3], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[3], posY, szX[3], szY, HALF_PI, PI+HALF_PI);


    // ellipse 05

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[4], posY, szX[3], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[4], posY, szX[3], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[4], posY, szX[3], szY, HALF_PI, PI+HALF_PI);

    // ellipse 06

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[5], posY, szX[2], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[5], posY, szX[2], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[5], posY, szX[2], szY, HALF_PI, PI+HALF_PI);

    // ellipse 07

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[6], posY, szX[1], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[6], posY, szX[1], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[6], posY, szX[1], szY, HALF_PI, PI+HALF_PI);


    // ellipse 08

    noStroke();
    fill(0, 0, 255);
    ellipse(posx[7], posY, szX[0], szY);

    strokeWeight(5);
    stroke(255);
    noFill();
    arc(posx[7], posY, szX[0], szY, -HALF_PI, PI+HALF_PI);
    stroke(0);
    arc(posx[7], posY, szX[0], szY, HALF_PI, PI+HALF_PI);

    translate(0, 90);
  }

  popMatrix();
}




void setup() {

  size (900, 720);
  background(#D5DB33);

  scale(0.8);

  column();

  pushMatrix();
  translate (805, 0);
  scale(-1,1);
  column();
  popMatrix();


  pushMatrix();
  translate (625, 0);
  column();
  popMatrix();







































  /*segunda linha
   
   
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha02,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha02, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha02, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha02,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha02, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha02, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha02,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha02, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha02, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha02,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha02, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha02, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha02,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha02, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha02, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha02,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha02, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha02, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha02,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha02, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha02, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha02,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha02, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha02, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   //terceira linha
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha03,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha03, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha03, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha03,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha03, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha03, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha03,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha03, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha03, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha03,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha03, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha03, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha03,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha03, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha03, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha03,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha03, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha03, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha03,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha03, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha03, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha03,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha03, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha03, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   //quarta linha
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha04,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha04, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha04, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha04,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha04, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha04, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha04,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha04, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha04, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha04,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha04, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha04, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha04,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha04, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha04, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha04,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha04, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha04, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha04,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha04, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha04, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha04,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha04, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha04, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   
   // quinta linha
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha05,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha05, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha05, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha05,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha05, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha05, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha05,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha05, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha05, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha05,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha05, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha05, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha05,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha05, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha05, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha05,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha05, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha05, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha05,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha05, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha05, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha05,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha05, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha05, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   // sexta linha
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha06,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha06, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha06, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha06,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha06, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha06, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha06,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha06, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha06, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha06,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha06, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha06, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha06,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha06, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha06, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha06,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha06, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha06, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha06,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha06, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha06, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha06,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha06, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha06, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   //setima linha
   
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha07,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha07, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha07, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha07,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha07, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha07, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha07,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha07, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha07, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha07,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha07, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha07, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha07,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha07, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha07, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha07,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha07, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha07, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha07,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha07, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha07, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha07,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha07, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha07, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   //oitava linha
   
   
   // ellipse 01
   
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[0],posY_linha08,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[0], posY_linha08, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[0], posY_linha08, szX[0], szY, HALF_PI, PI+HALF_PI);
   
   
   
   // ellipse 02
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[1],posY_linha08,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[1], posY_linha08, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[1], posY_linha08, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 03
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[2],posY_linha08,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[2], posY_linha08, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[2], posY_linha08, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 04
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[3],posY_linha08,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[3], posY_linha08, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[3], posY_linha08, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 05
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[4],posY_linha08,szX[3],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[4], posY_linha08, szX[3], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[4], posY_linha08, szX[3], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 06
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[5],posY_linha08,szX[2],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[5], posY_linha08, szX[2], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[5], posY_linha08, szX[2], szY, HALF_PI, PI+HALF_PI);
   
   // ellipse 07
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[6],posY_linha08,szX[1],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[6], posY_linha08, szX[1], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[6], posY_linha08, szX[1], szY, HALF_PI, PI+HALF_PI);
   
   
   // ellipse 08
   
   noStroke();
   fill(0,0,255);
   ellipse(posx[7],posY_linha08,szX[0],szY);
   
   strokeWeight(5);
   stroke(255);
   noFill();
   arc(posx[7], posY_linha08, szX[0], szY, -HALF_PI, PI+HALF_PI);
   stroke(0);
   arc(posx[7], posY_linha08, szX[0], szY, HALF_PI, PI+HALF_PI);
   */
}

