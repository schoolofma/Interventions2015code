String name = "wasabii"; //
String [] leftWords = {
  "ponytails", "blue skies", "spinning birds", "twirl", "clouds"
};
String [] rightWords = {
  "soft", "like a fluffy bird", "eyes of thunder", "parachutes", "submarines"
};

int lw= 0;
int rw=0;

boolean cycleWords= true;

// creat two arrays of words
//draw tje forst wprld pf eacj array on screen

void setup() {
  size(700, 500);
  println(leftWords.length);
  println(leftWords[0]);
  println(rightWords.length);
  println(rightWords[0]);
  ;

  //leftwords[]=(String)random(length);
}
void draw() {
  background(#E8E5B2);
  fill(#65BFF5);
  textSize(25);
  text(leftWords[lw], width/2, height/2); 
  textSize(25);
  text(rightWords[rw], width/5, height/2); 

  //update word counter
  if (cycleWords==true && frameCount %2==0) {
    lw=(int)random(0,leftWords.length);
    rw=(int)random(0,rightWords.length);
    /// only update counters when there are no remainders
   /* lw=lw+1;//lw++ plus one so its constanly moving
    if (lw>=leftWords.length) {
      lw=0;
    }
    rw=rw+1;
    if (rw>=rightWords.length) {
      rw=0;*/
    }
  }


void keyPressed() {
  if (key==' ') {
    if (cycleWords==true) {
      cycleWords=false;
    } else { 
      cycleWords=true;
    }
  }
}

