class TBands {
  TBands() {
  }
  void draw(float yT) {
    translate(0, yT);
    noFill();
    strokeWeight(0.001);
    //Edges
    rect(80, 10, 20, 120);
    rect(1031, 10, 20, 120);
    //Connector
    rect(100, 60, 931, 15);
    //Diagonal connectors
    beginShape();
    
    endShape();
    //Blanks
    fill(255);
    noStroke();
    rect(95, 61, 10, 14);
    rect(1026, 61, 10, 14);
    
    //fix
    stroke(0);
    strokeWeight(0.001);
  }
}
