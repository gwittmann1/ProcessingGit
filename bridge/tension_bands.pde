class TBands {
  TBands() {
  }
  void draw(float yT) {
    translate(0, yT);
    noFill();
    strokeWeight(0.001);
    //Edges
    rect(80, 10, 20, 200);
    rect(1700, 10, 20, 200);
    //Connector
    rect(100, 95, 1600, 15);
    //Diagonal connectors
    beginShape();
    
    endShape();
    //Blanks
    fill(255);
    noStroke();
    rect(95, 96, 10, 14);
    rect(1695, 96, 10, 14);
    
    //fix
    stroke(0);
    strokeWeight(0.001);
  }
}
