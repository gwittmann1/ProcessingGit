void setup() {
  size(480, 800);
}

int s = 0;
float a = 25;
float y = 2;
float c;

void draw() {
  Spikes spikes = new Spikes();
  Bird bird = new Bird();
  background(255);
  bird.draw();
  spikes.draw();
}

