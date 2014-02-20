/*
 * Interfacing Arduino from Processing
 * Example 1 Arduino Sketch
 * 
 * The Arduino listens for any data on the serial buffer.
 * If any data is received it is stored in a char-variable.
 * If the received value is 'H' then the led is turned on and
 * if the received value is 'L' then the LED is turned off.
 * No action is taken for other values.
 *
 * Abhik Pal
 */
 
// LED connected to pin 13
const int ledPin = 13;

void setup()
{
  // set the led as output
  pinMode(ledPin, OUTPUT);
  
  // begin serial communication with a baud rate of 9600
  Serial.begin(9600);
}

void loop()
{
  // check for any available data on the serial port
  if (Serial.available())
  {
    // store received value as a char
    char inputValue = Serial.read();
    
    // if the received value is 'H' turn on the LED
    if(inputValue == 'H')
    {
      digitalWrite(ledPin, HIGH);
    }
    // if the received value is 'L' turn off the led
    else if(inputValue == 'L')
    {
      digitalWrite(ledPin, LOW);
    }
    else
    {
      // else do nothing
    }
  }
  else
  {
    // do nothing
  }
  
  // a small delay to keep things sane
  delay(10);
}
