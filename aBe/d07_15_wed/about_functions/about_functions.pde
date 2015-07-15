// declaring functions
// that take arguments
// and return / don't return values back

void setup() {
  // call a function that takes one argument
  dance(44); 
  println("done dancing");
  
  // call a function that takes two arguments
  println("I'm multiplying 5 x 5 = ", 
    multiply(5, 5));
}

// function that takes one argument and
// returns nothing (void)
void dance(int howMuch) {
  println("dancing", howMuch);
}

// defining a function that
// takes two integers as arguments
// and returns an integer
int multiply(int a, int b) {
  return a + b * 5;
}
