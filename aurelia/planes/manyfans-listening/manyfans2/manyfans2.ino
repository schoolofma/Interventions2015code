// Define which pin to be used to communicate with Base pin of TIP120 transistor

//int potPin = A0;//don\t use this
//int potValue = 0;// processingVal this is the value from your processing now, not the pot
//
////for one fan
//int pmwpin = 11; //for this project, I pick Arduino's PMW pin 11
//int processingVal = 0;// processingVal this is the value from your processing now, not the pot


//for more fans
int pins [9] = {2, 3, 6, 7, 8, 9, 10, 11, 12}; //11, ...
int processingArrayValue [9];//introduce new array to read array values that are being sent from processing's array "arduinomessage"

void setup()
{
  Serial.begin(9600);//initialize the serial communication

  for (int i = 0; i < 9; i++) {
    pinMode(pins[i], OUTPUT); // Set pin for output to control TIP120 Base pin
    //  pinMode(pmwpin, OUTPUT); // Set pin for output to control TIP120 Base pin
    //analogWrite(TIP120pin, 255); // By changing values from 0 to 255 you can control motor speed
  }
}

void loop()
{
  if (Serial.available()) {
    //      //for one fan
    //      processingValue =  Serial.parseInt();
    //      digitalWrite(pmwpin, processingVal.parse);
    //
    //      if (Serial.find("a")) { //everytime there is an "a" it's going to write the next values
    //
    //        //  potValue = analogRead(potPin); //instead of this we create the function if
    //        //inside the if function you assign the value from the serial port to your variable processingVal
    //

    Serial.write("Arduino received: ");
    //for more fans
    for (int i = 0; i < 9; i++) {
      processingArrayValue[i] = Serial.parseInt();      
      digitalWrite(pins[i], processingArrayValue[i]); // send values to motor : By changing values from 0 to 255 you can control motor speed
      Serial.write(processingArrayValue[i] + " ");
    }







//    motorValue = map(0, 0, 255, 0, processingVal);
    //  motorValue = map(potValue, 0, 1023, 0, processingVal);
    //instead of this we assign the value from processingVal




    //  Serial.write(motorValue); // Send the value to the serial port, this will be read by processing
    delay(100);    // Wait 100ms for next reading
  }
}

