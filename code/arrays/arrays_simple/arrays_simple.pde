// declare an integer array
int [] allX = {50,3,100,4,235,45,67,88};

void setup(){
  size(300,300);
  println( allX[5] ); // prints 45
  println( allX.length ); // prints 8
}

void draw(){
  
  // loop through indexes of array and draw circles at each x pos
  // i++ is the same as i = i + 1
  for( int i = 0; i < allX.length; i++){
    ellipse( allX[i], 100, 20,20);
  }
  
}

