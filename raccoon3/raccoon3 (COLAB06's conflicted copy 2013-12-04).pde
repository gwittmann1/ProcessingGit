Raccoon rocky;
Food food;

void setup() { 
  size(750, 750);
  rocky = new Raccoon(width/2, height/2);
  food = new Food();
}

void draw() {
  background(220);
  float scale = 2; //* (1+0.5 * sin(millis() * 0.001));
  food.drawFood();
  rocky.setScale(scale).moveTowardsFood(food).rotateTowardsFood(food).drawIt();
}

class Raccoon {
  float x, y, rotationAngleInRadians, scale;

  Raccoon(float x_, float y_) {
    x = x_;
    y = y_;
    scale = 1;
  }

  void drawIt() {
    translate (x, y);
    rotate(rotationAngleInRadians);
    //draw body
    fill(#655B39);
    ellipse(0, -45*scale, 65*scale, 115*scale);
    //draw nose
    fill(#655B39);
    float eyeDiameter = width / 30 * scale;

    float noseDiameter = 1 * eyeDiameter;
    triangle(-25*scale, 0, 25*scale, 0, 0, 50*scale);
    //draw eyes
    fill(#FFFFCC);
    ellipse(0 - eyeDiameter/2, 0, eyeDiameter, 2 * eyeDiameter);
    ellipse(0 + eyeDiameter/2, 0, eyeDiameter, 2 * eyeDiameter);
    //draw pupils
    fill(0);
    float pupilDiameter = 0.6 * eyeDiameter;
    ellipse(0 - eyeDiameter/2, 0, pupilDiameter, pupilDiameter);
    ellipse(0 + eyeDiameter/2, 0, pupilDiameter, pupilDiameter);
    //draw tail
    fill(#655B39);
    ellipse(0, -210, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -220, -15*scale, 30*scale);
    fill(#655B39);
    ellipse(0, -230, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -240, -15*scale, 30*scale);
    fill(#655B39);
    ellipse(0, -250, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -260, -15*scale, 30*scale);
    fill(#655B39);
    ellipse(0, -270, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -280, -15*scale, 30*scale);
  }
  Raccoon moveTowardsFood(Food f) {
    moveTowards(f.x, f.y);
    float dist = sqrt((food.x - rocky.x)*(food.x - rocky.x) + (food.y - rocky.y)*(food.y - rocky.y));
    if (dist < 20) {
      food.teleport();
    }
    return this;
  }
  Raccoon moveTowards(float toX, float toY) {
    float easing = 0.05;
    x = x + easing*(toX-x);
    y = y + easing*(toY-y);
    return this;
  }
  Raccoon rotateTowards(Food f) {
    float x.y, float f.y;
    rotationAngleInRadians = atan( (pointToY - y) / (pointToX - x) ) ;
    rotationAngleInRadians -= PI/2;

    if (pointToX == x) {
      if ( pointToY < y ) {
        rotationAngleInRadians += PI;
      }
      return this;
    }
    if (pointToX < x)
      rotationAngleInRadians += PI;
    return this;
  }
  Raccoon setScale(float s) {
    scale = s;
    return this;
  }
}

