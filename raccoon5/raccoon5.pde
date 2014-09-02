Raccoon rocky;
ArrayList<Food> foods;

void setup() { 
  size(750, 750);
  rocky = new Raccoon(width/2, height/2);
  foods = new ArrayList<Food>();
  setNumFood(1);
  setScale(2.0);
}

void draw() {
  background(255);
  //* (1+0.5 * sin(millis() * 0.001));
  for (Food food : foods) {
    food.drawFood();
  }
  rocky.moveTowardsClosestFood().drawIt();
}

void setScale(float s) {
  rocky.setScale(s);
}
void setNumFood(int numFood) {
  while (foods.size () < numFood) {
    foods.add(new Food());
  }
  while (foods.size () > numFood) {
    foods.remove(0);
  }
}
class Raccoon {
  float x, y, rotationAngleInRadians, raccoonScale;

  Raccoon(float x_, float y_) {
    x = x_;
    y = y_;
    raccoonScale = 1;
  }

  void drawIt() {
    pushMatrix();
    translate (x, y);
    rotate(rotationAngleInRadians);
    //draw body
    fill(#655B39);
    ellipse(0, -45*raccoonScale, 65*raccoonScale, 115*raccoonScale);
    //draw nose
    fill(#655B39);
    float eyeDiameter = width / 30 * raccoonScale;
    float noseDiameter = 1 * eyeDiameter;
    triangle(-25*raccoonScale, 0, 25*raccoonScale, 0, 0, 50*raccoonScale);
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
    ellipse(0, -100*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#9F9B8E);
    ellipse(0, -110*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#655B39);
    ellipse(0, -120*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#9F9B8E);
    ellipse(0, -130*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#655B39);
    ellipse(0, -140*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#9F9B8E);
    ellipse(0, -150*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#655B39);
    ellipse(0, -160*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    fill(#9F9B8E);
    ellipse(0, -170*raccoonScale, -15*raccoonScale, 30*raccoonScale);
    popMatrix();
  }
  void setScale(float s) {
    raccoonScale = s;
  }

  Raccoon moveTowardsClosestFood() {
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
    rotateTowards(closestFood);
    return this;
  }

  Raccoon moveTowards(Food f) {
    float easing = 0.03;
    x = x + easing*(f.x-x);
    y = y + easing*(f.y-y);
    float d = dist(x, y, f.x, f.y);
    if (d < 100) f.move();

    return this;
  }
  Raccoon rotateTowards(Food f) {
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
}

class Food {
  float x, y, foodScale;

  Food() {
    x = random(width);
    y = random(height);
    foodScale = 1;
  }
  void move() {
    x = random(width);
    y = random(height);
  }
  void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 30*foodScale, 30*foodScale);
    popMatrix();
  }
}

