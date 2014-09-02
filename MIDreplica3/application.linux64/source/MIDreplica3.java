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

public class MIDreplica3 extends PApplet {

Raccoon rocky;
PShape square;
ArrayList<Food> foods;
BigSquare bgsqr;
PShape square2;
ArrayList<Food2> food2s;

public void setup() { 
  size(750, 750, P2D);
  rocky = new Raccoon(width/2, height/2);
  foods = new ArrayList<Food>();
  foods.add(new Food());
  bgsqr = new BigSquare(width/2, height/2);
  food2s = new ArrayList<Food2>();
  food2s.add(new Food2());
  setScale(2.0f);
  square = createShape(RECT, 0, 0, 50, 50);
  square.setFill(color(0));
  square2 = createShape(RECT, 0, 0, 100, 100);
  square2.setFill(color(0)); 
  println("setup complete");
}

public void draw() {
  background(255);
  for (Food food : foods) {
    food.drawFood();
  }
  rocky.moveTowardsClosestFood().drawIt();
  for (Food2 food2 : food2s) {
    food2.drawFood();
  }
  bgsqr.moveTowardsClosestFood2().drawItt();
}

public void setScale(float s) {
  rocky.setScale(s);
  bgsqr.setScale(s);
}
class Raccoon {
  float x, y, rotationAngleInRadians, raccoonScale;

  Raccoon(float x_, float y_) {
    x = x_;
    y = y_;
    raccoonScale = 1;
  }

  public void drawIt() {
    pushMatrix();
    translate (x, y);
    rotate(rotationAngleInRadians);
    //draw body
    shape(square, 25, 25);
    popMatrix();
  }
  public void setScale(float s) {
    raccoonScale = s;
  }

  public Raccoon moveTowardsClosestFood() {
    Food closestFood = null;
    float closestDistance = 9999999;
    for (Food food : foods) {
      float d = dist(x, y, food.x, food.y);
      if (d < closestDistance) {
        closestFood = food;
        closestDistance = d;
      }
    }
    moveTowards(closestFood);
    return this;
  }

  public Raccoon moveTowards(Food f) {
    if (f != null) {

      float easing = 0.03f;
      x = x + easing*(f.x-x);
      y = y + easing*(f.y-y);
      float d = dist(x, y, f.x, f.y);

      if (d < 100) f.move();
    }
    return this;
  }
}

class Food {
  float x, y, foodScale;

  Food() {
    x = random(width);
    y = random(height);
    foodScale = 1;
  }
  public void move() {
    x = random(width);
    y = random(height);
  }
  public void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 0*foodScale, 0*foodScale);
    popMatrix();
  }
}

class BigSquare {
  float x, y, rotationAngleInRadians, bigSquareScale;

  BigSquare(float x_, float y_) {
    x = x_;
    y = y_;
    bigSquareScale = 1;
  }

  public void drawItt() {
    pushMatrix();
    translate (x, y);
    rotate(rotationAngleInRadians);
    shape(square2, 25, 25);
    popMatrix();
  }
  public void setScale(float s) {
    bigSquareScale = s;
  }

  public BigSquare moveTowardsClosestFood2() {
    Food2 closestFood2 = null;
    float closestDistance = 9999999;
    for (Food2 food2 : food2s) {
      float d = dist(x, y, food2.x, food2.y);
      if (d < closestDistance) {
        closestFood2 = food2;
        closestDistance = d;
      }
    }
    moveTowards(closestFood2);
    return this;
  }

  public BigSquare moveTowards(Food2 f) {
    float easing = 0.03f;
    x = x + easing*(f.x-x);
    y = y + easing*(f.y-y);
    float d = dist(x, y, f.x, f.y);
    if (d < 25) f.move();

    return this;
  }
}

class Food2 {
  float x, y, food2Scale;

  Food2() {
    x = random(width);
    y = random(height);
    food2Scale = 1;
  }
  public void move() {
    x = random(width);
    y = random(height);
  }
  public void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 0*food2Scale, 0*food2Scale);
    popMatrix();
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MIDreplica3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
