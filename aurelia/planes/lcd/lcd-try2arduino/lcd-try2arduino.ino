// include the library code:
#include <LiquidCrystal.h>
int valX;

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  lcd.print("hello, world!");

  // initialize the serial communications:
  Serial.begin(9600);

}

void loop()
{
  // when characters arrive over the serial port...
  if (Serial.available()) {
    // wait a bit for the entire message to arrive
    delay(100);
    // clear the screen
    lcd.clear();
  }

  if (Serial.available()) {
    lcd.write(Serial.read());
    if (Serial.find("a")) { //everytime there is an "a" it's going to write the next values
      valX = Serial.parseInt(); // looks for the next valid integer in the incoming serial stream
      lcd.print(valX);
    }

  }





  // read all the available characters
  while (Serial.available() > 0) {
    // display each character to the LCD
    lcd.write(Serial.read());
    //    lcd.print(Serial.read());
    lcd.setCursor(0, 0);
  }

}


