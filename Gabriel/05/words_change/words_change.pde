
String[] leftWords = {
  "drink", "love", "hate", "die", "live"
};
String[] rightWords = {
  "fast", "young", "love", "hate"
};

int counterLeft=0; // counter for left words//
int counterRight=0; // counter for right words//


boolean cycleWords = true;


int bg; 




void setup () {
  
  

  frameRate(10);

  size (1280, 720);

  println(leftWords[0]);
}


void draw () {

  background(#F0DA8D);


  fill(255);
  textSize(180);
  text(leftWords[counterLeft], width/2-250, height/2);

  textAlign(CENTER);


  fill(#C70906);
  textSize(180);
  text(rightWords[counterRight], width/2+250, height/2);

  textAlign(CENTER);

  fill(0);
  textSize(50);
  text("press 'a' to stop", width/2, height-50);

  textAlign(CENTER);





  if (cycleWords == true) {
    
    counterLeft = (int)random(0,leftWords.length);
    counterRight = (int)random(0,rightWords.length);

   /* counterLeft++;// counterLeft= counterLeft + 1//

    counterRight++;



    if (counterLeft >= leftWords.length) {
      counterLeft=0;
    }

    if (counterRight>= rightWords.length) {
      counterRight=0;
    }*/
  }
}

void keyPressed() {
  if ( key == 'a') {
    
    if (cycleWords == true) {
      cycleWords = false;
    } else {
      cycleWords = true;
    }
    
    // next thing
    
    
  }
}

