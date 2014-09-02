float lastX;
float lastY;
int ballSize;

void setup() {
  size(630, 630);
  ballSize = 20;
  lastX = mouseX;
  lastY = mouseY;
  frameRate(40);
}

void draw() {
  background(200);
  float lastWeight = 0.93;
  lastX = lastWeight * lastX+ (1.0-lastWeight) * mouseX;
  lastY = lastWeight * lastY+ (1.0-lastWeight)* mouseY;
  ellipse(lastX, lastY, 
           Math.abs(lastX-mouseX)+10,  Math.abs(lastY-mouseY)+10);
}


