/*
 * Simple Talking Intruder Alert System
 * Using a PIR Sensor, Arduino and Processing
 *
 * uses the ttslib for processing
 * can be found at:
 * http://www.local-guru.net/blog/pages/ttslib
 *
 *
 * Abhik Pal
 */

// Required to communicate with the Arduino
import processing.serial.*;

// Required to make the sketch "talk"
import guru.ttslib.*;
 
Serial port;
TTS tts;

void setup()
{
  size(200, 200);
  background(20, 20, 20);
  tts = new TTS();

  // setting up the Serial port
  // change "COM6" to the port your Arduino is connected.
  port = new Serial(this, "COM6", 9600);

  // serialEvent() will be called whenever '\n' is detected
  // over the serial port
  port.bufferUntil('\n');
}

void draw()
{
  // Nothing to draw! :(
}

// triggered whenever '\n' is sent over the Serial Port
void serialEvent(Serial port)
{
  // Converting received value from string to an int
  String input = port.readStringUntil('\n');
  int value = int(trim(input));

  // checking the received value
  if (value == 1)
  {
      tts.speak("Intruder Alert."); // speak "Intruder alert!"
  }  
  else {
    // else do nothing
  }
}
