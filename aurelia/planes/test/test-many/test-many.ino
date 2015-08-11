//test for many fan change pin values in array to test per fan


int pins[] = {7,8,9,4,10,3,11,2,12};
int current=0;

void setup() {
  // activating as output pins only:
 for(int i = 0; i < 9; i++){
    pinMode(pins[i], OUTPUT);
    digitalWrite(pins[i],LOW);
 }

}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(pins[current], HIGH);
delay(100); // wait 1/2 sec
digitalWrite(pins[current], LOW);
delay(900); // wait 1/2 sec
current=(current+1)%9;
}
