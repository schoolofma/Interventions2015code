import processing.video.*;

//create video capture object

Capture video; 


int sz=2;



void setup() {

  size(640, 480);

  //initialize video objects

  video = new Capture (this, 640, 480);

  video.start();

  background(0);
}

void captureEvent(Capture c) {
  c.read();
}


void draw() {

  //background(0);


  // image(video,0,0);

  for (int i = 0; i<1000; i++) {



    //1: get total numbers of pixels and save in a variabe


    int totalPixels= video.width * video.height;


    //2: calculate a random position in the array and save as a int variable


    int rd = (int)random(totalPixels);



    //3: load image pixels and store color value at random position in a color variabe

    video.loadPixels();
    color c = video.pixels[rd];

    // get the brightness valeu of each pixel color value
    float bright = brightness(c);

    //4: calculate the position of the index with formulas:
    if (bright<180) {
      int x = rd % video.width;
      int y= (rd - x)/video.width;


      sz++;
      if (sz==15) {
        sz=sz*-1;
      }



      //5: fill with color variable


      fill(c);


      //6: draw triangle or ellipse using x and y;


      noStroke();
      ellipse(x, y, sz, sz);
    }
  }
}

