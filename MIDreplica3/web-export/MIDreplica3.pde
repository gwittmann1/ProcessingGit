Raccoon rocky;
PShape square;
ArrayList<Food> foods;
BigSquare bgsqr;
PShape square2;
ArrayList<Food2> food2s;

void setup() { 
  size(750, 750, P2D);
  rocky = new Raccoon(width/2, height/2);
  foods = new ArrayList<Food>();
  foods.add(new Food());
  bgsqr = new BigSquare(width/2, height/2);
  food2s = new ArrayList<Food2>();
  food2s.add(new Food2());
  setScale(2.0);
  square = createShape(RECT, 0, 0, 50, 50);
  square.setFill(color(0));
  square2 = createShape(RECT, 0, 0, 100, 100);
  square2.setFill(color(0)); 
  println("setup complete");
}

void draw() {
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

void setScale(float s) {
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

  void drawIt() {
    pushMatrix();
    translate (x, y);
    rotate(rotationAngleInRadians);
    //draw body
    shape(square, 25, 25);
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
    return this;
  }

  Raccoon moveTowards(Food f) {
    if (f != null) {

      float easing = 0.03;
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
  void move() {
    x = random(width);
    y = random(height);
  }
  void drawFood() {
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

  void drawItt() {
    pushMatrix();
    translate (x, y);
    rotate(rotationAngleInRadians);
    shape(square2, 25, 25);
    popMatrix();
  }
  void setScale(float s) {
    bigSquareScale = s;
  }

  BigSquare moveTowardsClosestFood2() {
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

  BigSquare moveTowards(Food2 f) {
    float easing = 0.03;
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
  void move() {
    x = random(width);
    y = random(height);
  }
  void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 0*food2Scale, 0*food2Scale);
    popMatrix();
  }
}


