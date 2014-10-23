class Cc {
  Cc() {
  }
  void draw(float xT) {
    translate(xT, 0);
    beginShape();
    vertex(0, 0);
    vertex(5, 0);
    vertex(5, 34);
    vertex(0, 34);
    vertex(0, 0);
    endShape();
  }
}

