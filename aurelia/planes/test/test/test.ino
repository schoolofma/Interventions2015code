//test for one fan change pin value to test per fan


int pin=4;

void setup() {
  // put your setup code here, to run once:
pinMode(pin,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(pin, HIGH);
delay(100); // wait 1/2 sec
digitalWrite(pin, LOW);
delay(900); // wait 1/2 sec
}
