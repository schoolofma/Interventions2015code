//test for fke serial communication


//// Define which pin to be used to communicate with Base pin of TIP120 transistor
int pins[] = {2,3,6,7,8,9,10,11,12};

void setup()
{
  Serial.begin(9600);//initialize the serial communication
  
  for(int i = 0; i < 9; i++){
    pinMode(pins[i], OUTPUT); // Set pin for output to control TIP120 Base pin
  }
}

void loop()
{
  if (Serial.available()) {
    //Processing sends something like this:
    //"0, 0, 0, 255, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0"
    
      for(int i = 0; i < 9; i++){
        digitalWrite(pins[i], Serial.parseInt());
      }
    
//    Serial.write("arduino says: got the value " + processingVal ); // in this case for debugging Send the value to the serial port, this will be read by processing
    delay(100);    // Wait 100ms for next reading - make efficient use of power since data will only be someimes, should be taken care of with serial.available
  }
}

