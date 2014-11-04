void setup() {
  size(480, 800);
}

int s = 0;
float a = 25;
float y = 2;

void draw() {
  Spikes spikes = new Spikes();
  Bird bird = new Bird();
  background(255);
  bird.draw();
  spikes.draw();
}

class Bird {
  Bird() {
  }
  void draw() {
    if (a>=455) {
      s=1;
    }
    if (a==25) {
      s=0;
    }
    if (s==0) {
      a=a+5;
    } else {
      a=a-5;
    }
    if (mousePressed) {
      y=y-5;
      
    } else {
      y=y*1.03;
    }
    noStroke();
    fill(0, 100, 200);
    ellipse(a, y, 50, 50);
  }
}

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


