String name = "Believe";
String [] leftWords = { "confused", "great", "trust", "hope", "gone", "soft", "unwritten", "always", 
  "light", "see", "give", "believe in", "forever", "fight for", "dream of", "envision", "sad"};
String [] rightWords = { "love", "beauty", "kindness", "time", "space", "the future", "truth", 
  "instinct", "vibrations", "life", "dreams", "pain", "air", "now", "peace", "inner-peace", 
  "balance", "laugther", "friends"};

int lW = 0;
int rW = 0;

boolean cycleWords = true;

PFont myFont;
void setup() {
  size (600, 600);
  myFont = createFont("Courier", 16);
  //String[] fontList = PFont.list();
  //println(fontList);
} //<>//

void draw () {

  textFont(myFont);

  background (0);
  fill(255);
  translate (150, 20);
  text(leftWords[lW], 30, height/2);
  translate(150, 0);
  text(rightWords[rW], 30, width/2, height/2);

  //update word counter

  if (cycleWords == true) {
    lW = lW +1;
    if (lW >= leftWords.length) {
      lW = 0;
    }

    rW = rW +1;
    if (rW >= rightWords.length) {
      rW = 0;
    }
  }
}

void keyPressed() {

  if (key == ' ' ) {
    cycleWords = false;
  } else {
    cycleWords = true;
  }
}