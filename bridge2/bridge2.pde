import processing.pdf.*;

void setup() {
  size(1200, 540, PDF, "laserCutBridge2"); //20 x 9 inches
  background(255);

  Curve curve = new Curve();
  Cc cc = new Cc();
  Tband tband = new Tband();

  translate(-17, -300);
  curve.draw(0);
  curve.draw(-100);

  tband.draw(-350);
  tband.draw(-20);

  translate(200, 1200);
  for (int i=0; i<220; i=i+10) {
    translate(10, 0);
    cc.draw(0);
  }
}

