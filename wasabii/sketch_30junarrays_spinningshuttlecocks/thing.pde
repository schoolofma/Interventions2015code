class Particle {

  int num = 50;
  float radius = 100;
  float center = 100;
  float osc;
  float x = 0;
  float y = 0;
  boolean stop =false; 

  Particle(float myx, float myy) {
    x= myx;
    y=myy;
  }

  void display() {
    //size(500, 500);
    smooth(8);
    // background(0);
    stroke(0);
    strokeWeight(.8);
  }

  void update() {
    pushMatrix();
    translate(x, y);

    if (stop==false) osc += 0.05;

    for (int i = 0; i < num; i++) {
      float x = center*cos(osc);
      float y = center*sin(osc);
      line( x, y, radius*cos(2*PI*i/num), radius*sin(2*PI*i/num));
    }
    
    popMatrix();
  }
  void mousymove() {




    float d = dist(x, y, mouseX, mouseY);
    if ( d < radius ) {
      println("inside!");
      osc-=0;
      stop=true;
    } else if (d>radius) {
      osc+=0.05;
      stop = false;
    }
  }
}

