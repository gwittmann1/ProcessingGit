void setup() {
  size(400, 400);
  background(255);
}

float a = 300;
float b = -300;

void draw() {
  stroke(0, random(50), random(50), random(100));
  a = a - 3;
  b = b + 3;
  if (a < -299) {
    a = 300;
    b = -300;
  }
  ellipse(200, 200, a, b);
  if (frameCount % 2 == 0 && frameCount < 201) {
    saveFrame(“image-####.gif”);
  }
}

