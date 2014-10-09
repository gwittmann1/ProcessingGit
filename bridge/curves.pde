class Curve {
  Curve() {
  } 

  void draw(float yTranslation) {
    //Main curve
    translate(0, yTranslation);
    noFill();
    strokeWeight(0.001);
    bezier(45, 1300, 615, 700, 1185, 700, 1755, 1300);
    bezier(15, 1300, 605, 670, 1195, 670, 1785, 1300);
    //Bottom lines
    line(15, 1300, 45, 1300);
    line(1755, 1300, 1785, 1300);

    //top square
    beginShape();
    fill(255);
    strokeWeight(0.001);
    vertex(805, 834);
    vertex(805, 824);
    vertex(995, 824);
    vertex(995, 834);
    endShape();
    //top square left indent
    beginShape();
    fill(255);
    vertex(800, 834);
    vertex(820, 834);
    vertex(820, 824);
    endShape();
    //top square right indent
    beginShape();
    fill(255);
    vertex(1000, 834);
    vertex(980, 834);
    vertex(980, 824);
    endShape();
    //left square
    beginShape();
    fill(255);
    strokeWeight(0.001);
    vertex(100, 1216);
    vertex(100, 1186);
    vertex(131, 1186);
    endShape();
    //left square hole
    rect(108, 1186, 15, 15);
    //right square
    beginShape();
    fill(255);
    strokeWeight(0.001);
    vertex(1700, 1216);
    vertex(1700, 1186);
    vertex(1669, 1186);
    endShape();
    //right square hole
    rect(1677, 1186, 15, 15);
    //Top fillers
    fill(255);
    noStroke();
    rect(800, 814, 20, 20);
    rect(981, 814, 20, 20);
    //side fillers
    rect(109, 1180, 14, 14);
    rect(1678, 1180, 14, 14);
    //fix
    noFill();
    stroke(0);
    strokeWeight(0.001);
  }
}

