float va=4;

class Bird {
  Bird() {
  }
  void draw() {
    //    vy = vy *1.03;
    if (a>=455) {
      s=1;
      score++;
      randomizeSpikeYValues();
    }
    if (a==25) {
      s=0;
      score++;
      randomizeSpikeYValues();
    }
    if (s==0) {
      a=a+va;
    } else {
      a=a-va;
    }
    if (mousePressed) {
      vy=5;
    } else {
      vy -= 0.3;
    }
    y=y-vy;
    if (y >795) {
      y = 795;
    }
    if (y < 5) {
      y = 5;
    }
    noStroke();
    //score;
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(240);
    text(score, 240, 390);
    //bird
    fill(0, 100, 200);
    ellipse(a, y, 50, 50);
  }
}

void randomizeSpikeYValues() {
  int spike = 0;
  for (int i = 0; i < spikeYValues.length; i++) {
    spike+= 50*((int) random(4)+1);
    spikeYValues[i] = spike;
  }
}


