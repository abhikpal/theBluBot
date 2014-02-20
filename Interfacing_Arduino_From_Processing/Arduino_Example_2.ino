/*
 * Interfacing Arduino from Processing
 * Example 2 Arduino Sketch
 * 
 * Analog values are first read from the pot-meter
 * connected on Analog Pin 0 (aka pin 14) and stored in
 * a variable. The value is then sent over the serial port
 * to a processing sketch running on a computer, where
 * the received value can be used to draw visuals, or do
 * other stuff.
 *
 * Abhik Pal
 */
 
// potmeter connected on pin 14 i.e Analog 0 (A0)
const int potPin = 14; 

void setup()
{
  // declaring potPin as INPUT is not nessasary as Analog 
  // pins are pre-configured to receive inputs.
  
  // begin serial communication with a baud rate of 9600
  Serial.begin(9600);
}

void loop()
{
  // read pot meter value
  int potReading = analogRead(potPin);
  
  // Send  the value via the serial port
  Serial.println(potReading);
  
  // add a delay to control amount of data sent and
  // prevent insanely weird results
  delay(100);
}

