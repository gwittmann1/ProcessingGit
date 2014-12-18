float va=5;
float spikeCount = 1;

class Bird {
  Bird() {
  }
  void draw() {
    //    vy = vy *1.03;
    if (a>=(width-25)) {
      s=1;
      score++;
      randomizeSpikeYValues();
      cY = random(50, 550);
      cX = 50;
    }
    if (a==25) {
      s=0;
      score++;
      randomizeSpikeYValues();
      cY = random(50, 550);
      cX = 350;
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
    if (y >(height-5)) {
      y = height-5;
    }
    if (y < 5) {
      y = 5;
    }
    noStroke();
    //score;
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(240);
    text(score, width/2, 290);
    //bird
    fill(birdColor);
    ellipse(a, y, 50, 50);
  }
}

void setSpikeCount(float s) {
  spikeCount = s;
}

void setColor(color c_) {
  if (c_ < 0) {
    birdColor = c_;
  } else {
    birdColor = unhex("FF" + c_);
  }
}

void randomizeSpikeYValues() {
  int spike = 0;
  for (int i = 0; i < spikeYValues.length; i++) {
    spike+= 50*((int) random(spikeCount)+1);
    spikeYValues[i] = spike;
  }
}

