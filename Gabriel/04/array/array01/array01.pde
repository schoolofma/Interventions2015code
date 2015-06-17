//DECLARE AN INTEGER ARRAY

//int [] allx = {50,2,20,200,210,120,0,15}; //index começa no 0//declare the values for the arrays

// how many indexes it will have

float[] allx = new float[60000];

float[] allx2 = new float[60000];

float[] ally = new float[60000];

color [] clr = new color[60000];

color [] clr2 = new color[60000];

int [] sz = new int[60000];

float r;

float[] speed = new float[60000];

void setup() {
  size(1920, 1080);



  // loop through all the indexes and give each a random value

  for ( int i=0; i< allx.length; i++) {
    allx[i] = (int)random(width);

    allx2[i]= (int)random(width);

    ally[i] = (int)random(height);

    clr[i] = color( random (200, 255), random(0, 200), random (0,255 ), random(500) );

    clr2[i] = color(random (255));

    sz[i]= (int)random(25);

    speed[i]= random (-5, 5);
  }
}

void draw() {

  //loop through indexes of array and draw circles at each x pos 

  // i++ is the same as i=i+1

  r++;


  background(0);

  for ( int i=0; i< allx.length; i++) {

    ally[i]= ally[i]+ speed[i];
    noStroke();
    fill(clr[i]);
    if (mousePressed) {
      fill(clr[i]+=10);
    } else {
      fill(clr[i]+=10);
    }


    if (mousePressed) {
      //allx2;
      rect(allx2[i]+=5, ally[i], sz[i], 2);
    } else {
      rect(allx[i], ally[i], 2,sz[i]);
    }
    


    //ellipse(allx[i], ally[i]-1000, sz[i], sz[i]);
    // ellipse(allx[i], ally[i]-2000, sz[i], sz[i]);

    if (ally[i] > height + sz[i]) {

      ally[i] = -sz[i];
    }
    
    if (allx2[i]> width + sz[i]) {
     
      allx2[i] = -sz[i];
    }





    //else if (ally[i] < 0) {ally[i] = -sz[i]-height;
    //}

    //sz[i]=sz[i]+1;
    //rotate(r/10900);
    // if ally[i] is greater than height plus size ally[i] equals negative size
  }
}

