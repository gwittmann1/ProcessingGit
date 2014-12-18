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
      if (candyD < 25) {
        score++;
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
    text("Press any key to restart", width/2, 170+(height/2));
    fill(240);
    text("Score", width/2, 105+(height/2));
    textSize(100);
    text(score, width/2, 40+(height/2));
    if (keyPressed) {
      gameState=0;
      s = 0;
      a = 25;
      y = 300;
      vy = 3;
      b = 1;
      score = 00;
    }
  }
}

