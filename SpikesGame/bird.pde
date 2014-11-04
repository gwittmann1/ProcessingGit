class Bird {
  Bird() {
  }
  void draw() {
    c++;
    c=c*1.03;
    if (a>=455) {
      s=1;
    }
    if (a==25) {
      s=0;
    }
    if (s==0) {
      a=a+6;
    } else {
      a=a-6;
    }
    if (mousePressed) {
      y=y-5;
      c=y;
    } else {
      y=c;
    }
    noStroke();
    fill(0, 100, 200);
    ellipse(a, y, 50, 50);
  }
}

