float scale = 1;
color hermitColor = color(255);

void setup() {
  size(500, 500);
  setScale(15);
  setColor(color(256, 0, 0));
}
void draw() {
  background(10, 110, 150);
  fill(hermitColor);
  ellipse(250, 250, scale, scale);
}
void setScale(float s) {
  scale = s;
}
void setColor(color c_) {
  if(c_ < 0) {
    hermitColor = c_;
  } else {
    hermitColor = unhex("FF" + c_);
  }
  println (c_);
}

