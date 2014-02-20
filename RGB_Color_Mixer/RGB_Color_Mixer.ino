/*
 * RGB Color Mixer
 * Takes value from the Serial port;
 * saves to an array;and writes
 * corresponding values to the RGB LED.
 *
 * Abhik Pal | 11:40, 19th Feb 2014
 */

// Positions of the R, G and B values
// on the array
#define RED 	0
#define GREEN 	1
#define BLUE 	2

// maximum values to be stored
const int maxVal = 3;

// the array to store the values
int colors[maxVal];

// a var. to keep track of the inserted
// values
int counter = 0;


// arduino pins to which LEDs are attached
const int red = 9;
const int green = 10;
const int blue = 11;

void setup()
{
    // setting up the leds as OUTPUT
    pinMode(red, OUTPUT);
    pinMode(green, OUTPUT);
    pinMode(blue, OUTPUT);

    // opening up the serial port @ 9600
    // bauds
    Serial.begin(9600);
}


void loop()
{
    // checking if the serial buffer contains
    // anything
    if(Serial.available())
    {
        // adding the value to the array
        // (value subtracted from 255 as I've got 
        // common anode RGB LED)
        colors[counter] = 255 - Serial.read();
        //incrementing the array counter
        counter++;
        // if the counter approaches the maxVal
        // set it to zero i.e. at the beginning of the 
        // array.
        if(counter == maxVal)	counter = 0;
    }

    // write proper values to the LEDs
    analogWrite(red, colors[RED]);
    analogWrite(green, colors[GREEN]);
    analogWrite(blue, colors[BLUE]);
}

