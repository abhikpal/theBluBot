/*
 * A Simple Monochromatic sound Visualizer
 *
 * This sketch plays a sound and sends the average 
 * values in the audio buffer as integer values to the arduino
 * where an LED changes its brightness based on the values sent.
 *
 * This project is an extension to the "Glowing Dodecahedron"
 * project and adds a bit of functionality to the dodecahedron.
 * The "Glowing Dodecahedron" project is available with instructions
 * and required circuit diagrams at: 
 * http://theblubot.blogspot.com/2014/01/glowing-dodecahedron.html
 *
 * design and code by:
 * Abhik Pal. 10th January 2014, 23:13
 */

// Importing the Minim and Serial libraries
import ddf.minim.*;
import processing.serial.*;

// creating required objects
AudioPlayer song;
Minim minim;
Serial port;

// variable to store the value to be sent
int sendVal = 255;

// variable to store whether the song is being played or not
boolean isPlaying = false;

void setup()
{
  // setting the size to be the current display size
  size(displayWidth, displayHeight);

  // setting everything up!
  minim = new Minim(this);

  // make sure to change the stuff inside the
  // "quotes" to mathch the file you want to play
  // here I'm playing "song.mp3" 
  song = minim.loadFile("song.mp3");

  // change the COM port to match your Arduino's COM port
  // change the baud Rate if you have used someting
  // different from 9600 bauds.
  port = new Serial(this, "COM5", 9600);
}

void draw()
{
  // clearing out the screen by creating a rectangle
  // having dimentions of the screen size.
  fill(20);
  noStroke();
  rect(0, 0, width, height);

  // this loop is used to extract and display visuals
  // based on the values present int the audio buffer
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    // variables to store the right and left audio values
    // i.e. sound being sent to each left and right speaker.
    float rightVal = song.right.get(i);
    float leftVal = song.left.get(i);

    // the next few lines account for the pattern being
    // displayed on the screen
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(map(i, 0, song.bufferSize(), 0, 360)));

    stroke(0, 0, 0, 10);
    strokeWeight(25);
    point(0, 150 + leftVal*200);
    point(0, 150 + rightVal*200);

    strokeWeight(2);
    stroke(220, 220, 20);
    point(0, 150 + leftVal*150);
    stroke(20, 220, 220);
    point(0, 150 + rightVal*150);

    popMatrix();

    // variable to store the average of the left and right channel
    // audio.
    float avgVal = (leftVal + rightVal)/2;

    // display a graph based on the average values
    stroke(0, 0, 0, 10);
    strokeWeight(25);
    point((width/2)-500+i, (height - 100) + avgVal*50);
    stroke(20, 220, 20);
    strokeWeight(2);
    point((width/2)-500+i, (height - 100) + avgVal*50);

    // a value to temprarily store the value to be sent.
    int tempVal = (int)(avgVal*255);
    tempVal = (int)map(abs(tempVal), 0, 255, 255, 0);

    // setting the value to be sent to be equal to the
    // temporary value.
    sendVal = tempVal;
  }

  // send out the value to your Arduino
  port.write(sendVal);

  // a bar indicating the sent values
  noStroke();
  fill(220, 220, 220);
  float rectLen = map(sendVal, 255, 0, 0, width-30);
  rect(15, 15, rectLen, 5);
}

// function to change play/pause the song each time the
// left mouse button is pressed.
void mousePressed()
{
  // if the song is already being played
  // we pause it and change the value of isPlaying variable
  if (isPlaying)
  {
    song.pause();
    isPlaying = false;
  } 

  // and if it is paused we play it and change 'isPlaying' accordingly
  // :P pretty simple right?
  else
  {
    song.play();
    isPlaying = true;
  }
}
