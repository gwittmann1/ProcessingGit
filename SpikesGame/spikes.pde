class Spikes {
  Spikes() {
  }
  void draw() {
    fill(100);
    translate(0, -25);
    for (int y=0; y<750; y = y+50) {
      translate(0, 50);
      triangle(0, 0, 25, 25, 0, 50);
      triangle(480, 0, 455, 25, 480, 50);
    }
    translate(-40, -725);
    for (int x=0; x<480; x=x+40) {
      translate(40, 0);
      triangle(0, 0, 40, 0, 20, 20);
      triangle(0, 800, 20, 780, 40, 800);
    }
  }
}

