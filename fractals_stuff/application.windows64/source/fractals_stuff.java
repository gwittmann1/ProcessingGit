import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class fractals_stuff extends PApplet {

int maxLevel = 4;//depth of recursion
int numFrames = 3 * 30;//3 seconds at 30 frames/second

public void setup() {
  size(720, 720);//720 for 720p movie
}

public void draw() {
  drawFrame(frameCount  - 1);
}

public void generateFractal(float x, float y, float sideLength, int level) {
  if (level > maxLevel) return;
  float sl3 = sideLength /3;
  //draw only if it is onscreen
  if (x + sl3 < width && y + sl3 < height) 
    //draw the white square in the middle
    rect(x + sl3, y + sl3, sl3, sl3);
  int newLevel = level + 1;
  //create fractals in surrounding 8 squares
  generateFractal(x, y, sl3, newLevel);
  generateFractal(x, y + sl3, sl3, newLevel);
  generateFractal(x, y + 2 * sl3, sl3, newLevel);
  generateFractal(x+ sl3, y, sl3, newLevel);
  generateFractal(x+ sl3, y + 2 * sl3, sl3, newLevel);
  generateFractal(x + 2 * sl3, y, sl3, newLevel);
  generateFractal(x + 2 * sl3, y + sl3, sl3, newLevel);
  generateFractal(x + 2 * sl3, y + 2 * sl3, sl3, newLevel);
}

public void drawFrame(int frame) {
  if (frame >= numFrames) return;
  float side = width * pow(3, ((float)frame) / numFrames);
  float x = (width - side) * 0.5f;
  float y =  0;

  int bgColor = color(frame*2.5f, frame*5, frame*10);
  background(bgColor);

  int fgColor = color(frame*10, frame*5, frame*2.5f);
  fill(fgColor);

  generateFractal(x, y, side, -2);
  saveFrame("square-####.png");
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "fractals_stuff" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
