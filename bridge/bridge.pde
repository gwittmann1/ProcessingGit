import processing.pdf.*;

void setup() {
  size(1140, 840, PDF, "laserCutBridge"); //19 x 14 inches
  background(255);
  Curve curve = new Curve();
  Extras extras = new Extras();
  TBands tbands = new TBands();
  Sconn sconn = new Sconn();
  
  translate(0, -9);
  tbands.draw(0);
  translate(-30, -85);
  tbands.draw(160);
  
  translate(0, -120);
  sconn.draw(0);
  sconn.draw(50);
  
  translate(0, -1150);
  extras.draw(0);
  extras.draw(-450);
  
  translate(195, 650);
  curve.draw(90);
  curve.draw(-70);
  curve.draw(-70);
  curve.draw(-70);
  curve.draw(-70);
  curve.draw(-70);
}

