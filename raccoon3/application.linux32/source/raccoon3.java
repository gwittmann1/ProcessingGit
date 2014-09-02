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

public class raccoon3 extends PApplet {

Raccoon rocky;
Food food;

public void setup() { 
  size(750, 750);
  rocky = new Raccoon(width/2, height/2);
  food = new Food();
}

public void draw() {
  background(255);
  float scale = 2; //* (1+0.5 * sin(millis() * 0.001));
    food.drawFood();
  rocky.setScale(scale).moveTowards(food).rotateTowards(food).drawIt();
}

class Raccoon {
  float x, y, rotationAngleInRadians, scale;

  Raccoon(float x_, float y_) {
    x = x_;
    y = y_;
    scale = 1;
  }

  public void drawIt() {
    translate (x, y);
    rotate(rotationAngleInRadians);
    //draw body
    fill(0xff655B39);
    ellipse(0, -45*scale, 65*scale, 115*scale);
    //draw nose
    fill(0xff655B39);
    float eyeDiameter = width / 30 * scale;

    float noseDiameter = 1 * eyeDiameter;
    triangle(-25*scale, 0, 25*scale, 0, 0, 50*scale);
    //draw eyes
    fill(0xffFFFFCC);
    ellipse(0 - eyeDiameter/2, 0, eyeDiameter, 2 * eyeDiameter);
    ellipse(0 + eyeDiameter/2, 0, eyeDiameter, 2 * eyeDiameter);
    //draw pupils
    fill(0);
    float pupilDiameter = 0.6f * eyeDiameter;
    ellipse(0 - eyeDiameter/2, 0, pupilDiameter, pupilDiameter);
    ellipse(0 + eyeDiameter/2, 0, pupilDiameter, pupilDiameter);
    //draw tail
    fill(0xff655B39);
    ellipse(0, -210, -15*scale, 30*scale);
    fill(0xff9F9B8E);
    ellipse(0, -220, -15*scale, 30*scale);
    fill(0xff655B39);
    ellipse(0, -230, -15*scale, 30*scale);
    fill(0xff9F9B8E);
    ellipse(0, -240, -15*scale, 30*scale);
    fill(0xff655B39);
    ellipse(0, -250, -15*scale, 30*scale);
    fill(0xff9F9B8E);
    ellipse(0, -260, -15*scale, 30*scale);
    fill(0xff655B39);
    ellipse(0, -270, -15*scale, 30*scale);
    fill(0xff9F9B8E);
    ellipse(0, -280, -15*scale, 30*scale);
  }
  public Raccoon moveTowards(Food f) {
    float easing = 0.05f;
    x = x + easing*(f.x-x);
    y = y + easing*(f.y-y);
    float d = dist(x, y, f.x, f.y);
    if(d < 100) f.move();
    
    return this;
  }
  public Raccoon rotateTowards(Food f) {
    rotationAngleInRadians = atan( (f.y - y) / (f.x - x) ) ;
    rotationAngleInRadians -= PI/2;

    if (f.x == x) {
      if ( f.y < y ) {
        rotationAngleInRadians += PI;
      }
      return this;
    }
    if (f.x < x)
      rotationAngleInRadians += PI;
    return this;
  }
  public Raccoon setScale(float s) {
    scale = s;
    return this;
  }
}


class Food {
  float x, y, scale = 1;

  Food() {
    x = random(width);
    y = random(height);
  }
  public void move() {
    x = random(width);
    y = random(height);
  }
  public void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 30*scale, 30*scale);
    popMatrix();
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "raccoon3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
