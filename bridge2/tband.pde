class Tband {
  Tband() {
  }
  void draw(float yT) {
    translate(0, yT);
    beginShape();
    vertex(50, 778);
    vertex(40, 788);
    vertex(1200, 788);
    vertex(1190, 778);
    vertex(50, 778);
    endShape();
  }
}
