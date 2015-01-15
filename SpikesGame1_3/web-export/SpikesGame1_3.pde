color birdColor = color(255);

void setup() {
  size(400, 600);
  setSpikeCount(4);
  setColor(color(0, 100, 200));
}

int s = 0;
int cY = 1000;
int cX = 50;
float a = 25;
float y = 300;
float vy = 3;
float b = 1;
int candyScore = 00;
int score = 00;
float[] spikeYValues = new float[] {
  50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550
};

int gameState; //0 = pre-grame, 1 = in-game, 2 = game over

void draw() {
  background(240);
  LeftSpikes leftspikes = new LeftSpikes();
  RightSpikes rightspikes = new RightSpikes();
  Bird bird = new Bird();
  topSpikes tSpikes = new topSpikes();
  Candy candy = new Candy();

  fill(200);
  ellipse(width/2, height/2, 200, 200);

  if (gameState==0) {
    noStroke();
    tSpikes.draw();
    translate(-350, -50);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(240);
    text("Click to start", width/2, 40+(height/2));
    if (mousePressed) {
      gameState = 1;
    }
  }

  if (gameState==1) {
    bird.draw();
    candy.draw();
    tSpikes.draw();
    translate(-350, -50);
    pushMatrix();
    for (float spikeY : spikeYValues) {
      pushMatrix();
      translate(0, spikeY);
      if (s==1) {
        leftspikes.draw();
      } else {
        rightspikes.draw();
      }
      float leftD = dist(a, y, 25, spikeY-12.5);
      float rightD = dist(a, y, (width-25), spikeY-12.5);
      if (leftD < 12.5 && leftD > -12.5 && s==1) {
        gameState=2;
        leftD = 50;
      }
      if (rightD < 25 && rightD > -12.5 && s==0) {
        gameState=2;
        rightD = 50;
      }
      float candyD = dist(a, y, cX, cY);
      if (candyD < 30) {
        candyScore++;
        cY = 1000;
      }
      popMatrix();
    }
    popMatrix();
    if (y > height-25 || y < 25) {
      gameState=2;
    }
  }

  if (gameState==2) {
    fill(50);
    ellipse(a, y, 50, 50);
    tSpikes.draw();
    translate(-350, -50);
    pushMatrix();
    leftspikes.draw();
    popMatrix();
    rightspikes.draw();
    score = score;
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(150);
    text("Game Over", width/2, 220);
    text("Press any key to restart", width/2, 200+(height/2));
    fill(240);
    text("Score", width/2, 105+(height/2));
    textSize(100); 
    text(score, width/2, 40+(height/2));
    textSize(30);
    fill(252, 182, 3);
    text("Candies:" + candyScore, width/2, 470);
    if (keyPressed) {
      gameState=0;
      s = 0;
      a = 25;
      y = 300;
      vy = 3;
      b = 1;
      score = 00;
      candyScore = 00;
    }
  }
}

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
    textSize(30);
    fill(252, 182, 3);
    text("Candies:" + candyScore, width/2, 420);
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

class Candy {
  void draw() {
    noStroke();
    fill(252, 182, 3);
    ellipse(cX, cY, 30, 30);
  }
}
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


