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

