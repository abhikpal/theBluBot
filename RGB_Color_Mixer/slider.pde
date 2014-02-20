public class slider
{
  // constructor takes initial color, location (x, y) and
  // position of the slider 
  slider(color c, float x, float y, float l)
  {
    sliderCol = c;
    posX = x;
    posY = y;
    loc = l;
    drawSlider();
  }

  // draws the slider on the screen
  private void drawSlider()
  {
    noStroke();
    fill(sliderCol);
    rect(posX, posY, 100, 300);
  }

  // updtaes color of the slider to the given value
  // and changes position of the slider accordingly
  public void update(color c)
  {
    sliderCol = c;
    drawSlider();
    fill(220, 220, 220);
    if (mousePressed)
    {
      if ((mouseX >= posX)&&(mouseX <= (posX + 100)))
      {
        if ((mouseY >= 50) && (mouseY <= 350))
        {
          loc = mouseY - 50;
        }
      }
    }

    sliderVal = map(loc, 0.0, 300.0, 255.0, 0.0);

    rect((posX - 10), (posY + loc), 120, 20);
  }
  
  // return the position of the slider
  public float getVal()
  {
    return sliderVal;
  }
  
  private color sliderCol;
  private float posX;
  private float posY;
  private float loc;
  private float sliderVal;
}

