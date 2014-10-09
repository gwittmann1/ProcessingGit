void setup() {
  size(1800, 1100);
  background(255);
  Curve curve = new Curve();
  Extras extras = new Extras();
  TBands tbands = new TBands();
  Sconn sconn = new Sconn();
  
  tbands.draw(0);
  translate(-30, -85);
  tbands.draw(210);
  
  translate(0, -120);
  sconn.draw(0);
  sconn.draw(50);
  
  translate(0, -1150);
  extras.draw(0);
  extras.draw(-450);
  
  translate(195, 850);
  curve.draw(90);
  curve.draw(-70);
  curve.draw(-70);
  curve.draw(-70);
  curve.draw(-70);
  curve.draw(-70);
}

