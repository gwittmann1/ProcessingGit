class Extras {
  Extras() {
  }
  void draw(float xT) {
    translate(xT, 0);
    noFill();
    strokeWeight(.001);
    //Vertical connectors
    rect(910, 1300, 200, 20);
    rect(700, 1300, 200, 20);
    rect(910, 1275, 200, 15);
    rect(700, 1275, 200, 15);
  }
}
