float[] oldX, oldY;
int numberOfPoints;
void setup() {
  size (640, 480);
  numberOfPoints = 30;
  oldX = new float[numberOfPoints];
  oldY = new float[numberOfPoints];
}
void draw() {
  background (250);
  noStroke();
  textSize(32);
  // index will be from 0 to numberOfPoints;
  int index = frameCount % numberOfPoints;
  fill(0, 100, 100);
  oldX[index] = mouseX;
  oldY[index] = mouseY;
  for (int i=0; i < numberOfPoints; i++) {
    //text("Yo", oldX[i], oldY[i]);
    ellipse(oldX[i], oldY[i], 30, 30);
  }
  float easing = .01;
  oldX[index]=oldX[index] + easing*(mouseX-oldX[index]);
}


