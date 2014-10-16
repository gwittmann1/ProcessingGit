class Curve {
  Curve() {
  } 

  void draw(float yTranslation) {
    //Main curve
    translate(0, yTranslation);
    noFill();
    strokeWeight(0.001);
    bezier(45, 1300, width/3+45, 900, (width/3)*2-45, 900, 1086, 1300);
    bezier(15, 1300, width/3+15, 870, (width/3)*2-15, 870, 1116, 1300);
    //Bottom lines
    line(15, 1300, 45, 1300);
    line(1086, 1300, 1116, 1300);

    //top square
    translate(-334.5, 154);
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
    //Top fillers
    fill(255);
    noStroke();
    rect(800, 814, 20, 20);
    rect(981, 814, 20, 20);
    translate(334.5, -154); //////////
    translate(-2, -2);
    //left square
    stroke(0);
    beginShape();
    fill(255);
    strokeWeight(0.001);
    vertex(100.7, 1217);
    vertex(100.7, 1187);
    vertex(130.7, 1187);
    endShape();
    //left square hole
    rect(108, 1186, 15, 15);
    translate(-664, 0);
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
    //side fillers
    noStroke();
    rect(1678, 1180, 14, 14);
    translate(664, 0);
    rect(109, 1180, 14, 14);
    //fix
    noFill();
    stroke(0);
    strokeWeight(0.001);
  }
}

