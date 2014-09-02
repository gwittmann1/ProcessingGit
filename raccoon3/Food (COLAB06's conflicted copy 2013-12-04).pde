class Food {
  float x, y, scale = 1;

  Food() {
    x = random(width);
    y = random(height);
  }
  void drawFood() {
    pushMatrix();
    fill(255, 0, 0);
    translate(x, y);
    ellipse(0, 0, 25*scale, 25*scale);
    popMatrix();    
  }
}

