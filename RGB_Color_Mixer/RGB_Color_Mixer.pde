/*
 * RGB Color Mixer Processing Sketch
 * Draws sliders on the screen and sends values to the Arduino
 * Gives a preview of the color and cliking the preview prints out
 * the RGB values. 
 *
 * Abhik Pal | 11:49, 19th Feb 2014
 */


// import the Serial library
import processing.serial.*;

// making some sliders
slider red;
slider green;
slider blue;

// ... and a Serial port
Serial port;

// initializing the RGB values to zero
float redVal = 0;
float greenVal = 0;
float blueVal = 0;

void setup()
{
  // Setting up the screen
  size(850, 400);
  background(20);

  // opening up the Serial port, change the "COM5" and baud rate
  // to suit your needs
  port = new Serial(this, "COM5", 9600);

  // initializing the sliders
  red = new slider(color(220, 20, 20), 50, 50, 00);
  green = new slider(color(20, 220, 20), 200, 50, 10);
  blue = new slider(color(20, 20, 220), 350, 50, 10);
}

void draw()
{
  // clear everything
  background(20);

  // update the slider position
  // change color to the current color
  red.update(color(redVal, 0, 0));
  green.update(color(0, greenVal, 0));
  blue.update(color(0, 0, blueVal));

  // store the slider values in respective variables
  redVal = red.getVal();
  greenVal = green.getVal();
  blueVal = blue.getVal();

  // write out the values to the Arduino
  port.write(int(redVal));
  port.write(int(greenVal));
  port.write(int(blueVal));


  // draw the preview window
  strokeWeight(5);
  stroke(220, 220, 220);
  fill(redVal, greenVal, blueVal);
  rect(500, 50, 300, 300);
}

// print out the values when the mouse is clicked and 
// released inside the preview area
void mouseReleased()
{
  if ((mouseX > 500) && (mouseX < 800))
  {
    if ((mouseY > 50) && (mouseY < 350))
    {
      print("R:\t" + redVal);
      print(" G:\t"  + greenVal);
      print(" B:\t" + blueVal);
      println();
    }
  }
}

