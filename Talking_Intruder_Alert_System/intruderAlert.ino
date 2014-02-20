/*
 * Arduino Code for 
 * Simple Talking Intruder Alert System
 * 
 * Abhik Pal
 */
 
#define pirPin 7 // PIR Sensor connected to pin 7
#define ledPin 13 // LED connected to pin 13

void setup()
{
  pinMode(pirPin, INPUT);  // Setting PIR pin as INPUT
  pinMode(ledPin, OUTPUT); // Setting LED pin as OUTPUT
  Serial.begin(9600); // Starting Serial Communication @ 9600 bauds
}

void loop()
{
  // storing PIR state in a variable
  int pirState = digitalRead(pirPin);

  if(pirState == 1)
  {
    // send value only if PIR detects something
    Serial.println(pirState);

    // turn on LED if the PIR sensor detects something
    digitalWrite(ledPin, HIGH);

    // wait for a while
    delay(1000);
  }

  // else turn off LED and send nothing
  else
    digitalWrite(ledPin, LOW);
}

