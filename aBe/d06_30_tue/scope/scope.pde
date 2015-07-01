
// scope -
// 1. Prefer local variables to global variables
// 2. You need global variables to remember state 
//    between animation frames.

int someVar = 22;

void setup() {
  int x = 22;
  for(int i=0; i<10; i++) {
    println(i);
  }
  println(i);
}

void draw() {
  int sz = 50;
  
  ellipse(50, 50, sz, sz);  
  sz = sz - 10;

  ellipse(50, 50, sz, sz);  
  sz = sz - 10;
  
  ellipse(50, 50, sz, sz);  
  sz = sz - 10;
}

void doSomething() {
  int sz = 22;
}

