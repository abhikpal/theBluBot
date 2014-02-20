/*
 * Interfacing Arduino from Procesisng
 * Example 1 Processing Sketch
 *
 * The code sends a 'H' to the ardunino via the Serial port
 * if the mouse coordinates are inside the button and the 
 * left mouse button is pressed.
 * If either of the two conditions are not met then a 'L' is
 * sent.
 * The sent values are then interpreted by the Arduino to
 * switch on/off the led connected on pin 13 
 *
 * Abhik Pal
 */

// import the processing serial library
import processing.serial.*;

// create an instance of the Serial object
Serial arduinoPort;

void setup()
{
  // setting up the basic interface attributes
  size(400, 400);
  background(20);
  noStroke();
  fill(100);

  // set up the serial port
  // change "COM5" to the port your arduino is connected
  arduinoPort = new Serial(this, "COM5", 9600);
}

void draw() {
  
  // draw a rectangle to act as our button
  rect(150, 150, 100, 100);
  
  // check if the mouse pointer is over our button
  if((mouseX > 150) && (mouseX < 250) && (mouseY > 150) && (mouseY < 250))
  {
    // change fill color to give visual feedback
    fill(220);
    
    // check if the mouse button is presses
    // i.e. detect a click
    if(mousePressed == true)
    {
      // send 'H' to light up the LED on the arduino
      arduinoPort.write('H');  
    }
    else
    {
      // else do nothing
    }
  }
  else
  {
    // use default fill
    fill(110);
    
    // send 'L' to turn off the LED
   arduinoPort.write('L'); 
  }
}  
