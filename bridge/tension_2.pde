class Sconn {
  Sconn() {
  }
  void draw(float xTr) {
    translate(0, -16);
    translate(xTr, 0);
    for (int i = 0; i < 120; i = i+30) {
      translate(30, 0);
      noFill();
      strokeWeight(0.001);
      beginShape();
      vertex(120, 140);
      vertex(220, 190);
      vertex(200, 190);
      vertex(120, 150);
      vertex(120, 140);
      endShape();
    }
    translate(0, 16);
  }
}
