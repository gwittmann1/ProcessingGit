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
    triangle(width, 0, width-25, 25, width, 50);
  }
}

class topSpikes {
  topSpikes() {
  }
  void draw() {
    translate(-50, 0);
    fill(100);
    for (int x=0; x<400; x=x+50) {
      translate(50, 0);
      triangle(0, 0, 50, 0, 25, 25);
      triangle(0, height, 25, height-25, 50, height);
    }
  }
}

