class Food {
  float x, y, scale = 1;

  Food() {
    x = random(width);
    y = random(height);
  }
  void move() {
    x = random(width);
    y = random(height);
  }
  void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 30*scale, 30*scale);
    popMatrix();
  }
}

