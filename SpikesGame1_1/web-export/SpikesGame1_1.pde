void setup() {
  size(480, 800);
}

int s = 0;
float a = 25;
float y = 2;
float c = 3;
float b = 1;
int score = 0;

void draw() {
  Spikes spikes = new Spikes();
  Bird bird = new Bird();
  topSpikes tSpikes = new topSpikes();
  background(240);
  bird.draw();
  tSpikes.draw();
  translate(-440, -50);
  for (float spike=0; spike<800; spike=spike+50) {
    translate(0, 50);
    spikes.draw();
  }
}

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

class Spikes {
  Spikes() {
  }
  void draw() {
    fill(100);
    triangle(0, 0, 25, 25, 0, 50);
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

