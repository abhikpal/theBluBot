/*
 * Interfacing Arduino from Procesisng
 * Example 2 Processing Sketch
 *
 * The sensor readings sent from the Arduino are
 * converted to int data type and stored in a variable
 * The variable is then used to draw a simple bar on the
 * window. The height of the bar is dependent on the
 * value received i.e. it changes when we rotate the
 * pot-meter.
 *
 * Abhik Pal
 */


// import the processing serial library
import processing.serial.*;

// create an instance of the Serial object
Serial arduinoPort;

// this variable will store the height of the 
// bar.
float barHeight = 0;

void setup()
{
  // setting up the basic interface attributes
  size(600, 150);
  background(20);
  noStroke();
  fill(220);

  // set up the serial port
  // change "COM5" to the port your arduino is connected
  arduinoPort = new Serial(this, "COM5", 9600);
  
  // serialEvent will be triggred when a
  // '\n' (newline) character is received.
  // As we have used Serial.println(); to send our data
  // from the Arduino a '\n' character will be found at the end
  // of our desired value i.e. the pot-meter reading
  arduinoPort.bufferUntil('\n');
  
}

void draw()
{
  // clear the screen so that new changes can be
  // observed
  background(20);
  // drawing our  bar  
  rect(25, 25, barHeight, 100);
}


// Triggreed whenever the character defined in 
// arduinoPort.bufferUntil(); is received
void serialEvent(Serial arduinoPort)
{
  // store the raw input received from the arduino
  // as string.
  // the readStringUntil() method makes sure that
  // only the values upto '\n' charcter are stored
  String rawInput = arduinoPort.readStringUntil('\n');
  
  // convert the string to an int
  // the trim() function is used to remove any spaces
  // from the string
  int rawVal = int(trim(rawInput));
  
  // map the received values from a range of 0 to 1023
  // to a smaller range of 0 to 550; our maximum and minimum
  // bar heights.
  barHeight = map(rawVal, 0, 1023, 0, 550);
}
