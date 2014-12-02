class LeftSpikes {
  LeftSpikes() {
  }
  void draw() {
    fill(100);
    triangle(0, 0, 25, 25, 0, 50);
  }
}

class RightSpikes {
  RightSpikes() {
  }
  void draw() {
    fill(100);
    triangle(480, 0, 455, 25, 480, 50);
  }
}

class topSpikes {
  topSpikes() {
  }
  void draw() {
    translate(-40, 0);
    fill(100);
    for (int x=0; x<480; x=x+40) {
      translate(40, 0);
      triangle(0, 0, 40, 0, 20, 20);
      triangle(0, 800, 20, 780, 40, 800);
    }
  }
}

