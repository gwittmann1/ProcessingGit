class Bird {
  Bird() {
  }
  void draw() {
    c=c*1.03;
    if (a>=455) {
      s=1;
      score++;
    }
    if (a==25) {
      s=0;
      score++;
    }
    if (s==0) {
      a=a+6;
    } else {
      a=a-6;
    }
    if (mousePressed) {
      y=y-5;
      c=3;
    } else {
      y=y+c;
    }
    if (y >795) {
      y = 795;
    }
    if (y < 5) {
      y = 5;
    }
    noStroke();
    //score
    fill(200);
    ellipse(240, 400, 200, 200);
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(240);
    text(score, 240, 400);
    //bird
    fill(0, 100, 200);
    ellipse(a, y, 50, 50);
  }
}

