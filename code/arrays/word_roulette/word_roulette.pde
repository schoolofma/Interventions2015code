String [] wordsLeft = {"Move","Reach","We","Now","No","Live","Hide","Kill","Find"};
String [] wordsRight = {"me","you","us","Hope","Wait","Start","Life","Run","All"};

int wL = 0;
int wR = 0;
boolean bRunning = true;

void setup(){
  size(500,200);
}

void draw(){
  
  background(0);
  
  if(bRunning){
    wL = int(random(wordsLeft.length));
    wR = int(random(wordsRight.length));
  }
  
  textSize(48);
  text(wordsLeft[wL],120,height/2);
  text(wordsRight[wR],width/2,height/2);
  
}


void keyPressed(){
  if( key == ' '){
    if(bRunning == true) bRunning = false;
    else bRunning = true;
  }
  
}

