class Curve {
  Curve() {
  }

  void draw(float yTranslation) {
    
    translate(0, yTranslation);
    noFill();
    strokeWeight(0.001);
    //larger curve
    bezier(35, 800, 442, 340, 787, 340, 1196, 800);
    bezier(15, 800, 442, 320, 787, 320, 1216, 800);
    line(15, 800, 35, 800);
    line(1196, 800, 1216, 800);
    //smaller curve
    bezier(95, 800, 442, 400, 787, 400, 1136, 800);
    bezier(75, 800, 442, 380, 787, 380, 1156, 800);
    line(75, 800, 95, 800);
    line(1136, 800, 1156, 800);
    //Top connectors
    rect(700, 700, 120, 15);
    rect(500, 700, 120, 15);
  }
}

