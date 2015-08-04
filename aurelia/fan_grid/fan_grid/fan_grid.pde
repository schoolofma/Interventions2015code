int latitude;
int longitude;


int start;

void setup(){
  size(638, 638);
  start = millis(); //now
  
  latitude = round(random(0, width/2));
  longitude = round(random(0, height/2));
  
  
}

void draw(){
  if(millis() - start > 100){//has it been 2 seconds since our last 'start'
    //whatever we want to do every 2 seconds goes here
    getNewDataPoint();
    start = millis();
  }
  
}

void getNewDataPoint(){
  int fanside = width/5; 
  latitude = latitude + round(random(-1, 5))*5; //y
  longitude = longitude + round(random(-1,5))*5; //x
  
  int row = (longitude / fanside);
  int col = (latitude / fanside);
  
  fill(255, 0, 0);
  rect(col*fanside, row*fanside, fanside, fanside);
  fill(255, 255, 255);
  
  
  ellipse(latitude, longitude, 4, 4);
  
  
  for(int i = 0; i < 5; i++){
    line(i*fanside,0 ,i*fanside, height);
    line(0, i*fanside, width, i*fanside);
  }

}