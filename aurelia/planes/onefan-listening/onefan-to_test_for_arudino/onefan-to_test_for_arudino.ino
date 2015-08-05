//// Define which pin to be used to communicate with Base pin of TIP120 transistor
//
//int potPin = A0;//don\t use this
//int potValue = 0;// processingVal this is the value from your processing now, not the pot
//
////for one fan
//int pmwpin = 11; //for this project, I pick Arduino's PMW pin 11
////int processingVal = 0;// processingVal this is the value from your processing now, not the pot
//
//void setup()
//{
//  Serial.begin(9600);//initialize the serial communication
//  pinMode(pmwpin, OUTPUT); // Set pin for output to control TIP120 Base pin
//  //  pinMode(pmwpin, OUTPUT); // Set pin for output to control TIP120 Base pin
//  analogWrite(TIP120pin, 255); // By changing values from 0 to 255 you can control motor speed
//}
//
//void loop()
//{
//  if (Serial.available()) {
//    //for one fan
//    processingVal =  Serial.parseInt(); //parse int still used since processing can only send characters not ints
//    analogWrite(pmwpin, processingVal);
//    
//    Serial.write("arduino says: got the value " + processingVal ); // in this case for debugging Send the value to the serial port, this will be read by processing
//    delay(100);    // Wait 100ms for next reading - make efficient use of power since data will only be someimes, should be taken care of with serial.available
//  }
//}

// Define which pin to be used to communicate with Base pin of TIP120 transistor

int TIP120pin = 9; //for this project, I pick Arduino's PMW pin 11
int potPin = A0;
int potValue = 0;
int motorValue = 0;

void setup()
{
  Serial.begin(9600);
pinMode(TIP120pin, OUTPUT); // Set pin for output to control TIP120 Base pin
//analogWrite(TIP120pin, 255); // By changing values from 0 to 255 you can control motor speed
}

void loop()
{
  potValue = analogRead(potPin);
  motorValue = map(potValue, 0, 1023, 0, 255);
analogWrite(TIP120pin, motorValue); // By changing values from 0 to 255 you can control motor speed
  
}


