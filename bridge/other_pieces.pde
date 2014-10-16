class Extras {
  Extras() {
  }
  void draw(float xT) {
    translate(-340, 700);
    translate(xT, 0);
    noFill();
    strokeWeight(.001);
    //Vertical connectors
    rect(910, 1300, 120, 20);
    rect(700, 1300, 120, 20);
    rect(910, 1275, 120, 15);
    rect(700, 1275, 120, 15);
    translate(340, -700);
  }
}
