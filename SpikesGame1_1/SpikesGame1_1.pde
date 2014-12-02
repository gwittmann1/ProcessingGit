void setup() {
  size(480, 800);
}

int s = 0;
float a = 25;
float y = 400;
float vy = 3;
float b = 1;
int score = 00;
float spikeSwitch = 1000;
float spikeSwitch2 = 1000;
float[] spikeYValues = new float[] {
  50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750
};

int gameState; //0 = pre-grame, 1 = in-game, 2 = game over

void draw() {
  background(240);
  LeftSpikes leftspikes = new LeftSpikes();
  RightSpikes rightspikes = new RightSpikes();
  Bird bird = new Bird();
  topSpikes tSpikes = new topSpikes();

  fill(200);
  ellipse(240, 400, 200, 200);

  if (gameState==0) {
    noStroke();
    tSpikes.draw();
    translate(-440, -50);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(240);
    text("Click to start", 240, 440);
    if (mousePressed) {
      gameState = 1;
    }
  }

  if (gameState==1) {
    bird.draw();
    tSpikes.draw();
    translate(-440, -50);
    pushMatrix();
    for (float spikeY : spikeYValues) {
      pushMatrix();
      translate(0, spikeY);
      if (s==1) {
        leftspikes.draw();
      } else {
        rightspikes.draw();
      }
      float leftD = dist(a, y, 25, spikeY);
      float rightD = dist(a, y, 455, spikeY);
      if (leftD < 12.5 || rightD < 12.5) {
        gameState=2;
      }
      popMatrix();
    }
    popMatrix();
    if (y > 775 || y < 25) {
      gameState=2;
    }
  }

  if (gameState==2) {
    fill(50);
    ellipse(a, y, 50, 50);
    tSpikes.draw();
    translate(-440, -50);
    pushMatrix();
    leftspikes.draw();
    popMatrix();
    rightspikes.draw();
    score = score;
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(150);
    text("Game Over", 240, 320);
    fill(240);
    text("Score", 240, 505);
    textSize(100);
    text(score, 240, 440);
  }
}

