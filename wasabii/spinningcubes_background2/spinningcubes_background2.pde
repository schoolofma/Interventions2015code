float sz= 90;
float szTarg= 90;

void setup() {
  //size + P3D= 3D enviroment
  size(1440, 900, P3D);
  background(255);
}

void draw() {
  // if size is smaller the target { equation} else if
     if ( sz < szTarg) {
      sz = sz+ 10;
    } else if (sz > szTarg) {
      sz = sz - 10;
    }


    if (szTarg > 90 && sz >= szTarg) {// allows snap back
     // szTarg = 90;
    }
    
    
  //columuns
  for (int x =0; x<width; x=x+90) {

    //rows
    for (int y=0; y<height; y=y+90) {



      pushMatrix();

      translate(x, y);
      rotateY(frameCount*0.3);
      fill(#B9AC98);
      stroke(#F0FAE8);


      //size of box in pixels
      box(sz);
      popMatrix();

      /*  //orangebox
       pushMatrix();
       
       translate(100, height/2);
       rotateY(frameCount*0.1);
       fill(#F24C0A);
       stroke(#F0FAE8);
       
       
       //size of box in pixels
       box(30);
       popMatrix();
       */
      //orangebox
      pushMatrix();

      translate(x, y,+50);
      rotateY(frameCount*0.1);
      fill(#F24C0A);
      stroke(#F0FAE8);


      //size of box in pixels
      box(30);
      popMatrix();
    }
  }
}


void mousePressed(){
  szTarg=random(20,400);// background grows randomly from 20-400
  println(szTarg);
  //szTarg=
}

