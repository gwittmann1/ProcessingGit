Raccoon rocky;

void setup() { 
  size(750, 750);
  rocky = new Raccoon(width/2, height/2);
}

void draw() {
  background(255);
  float scale = 2; //* (1+0.5 * sin(millis() * 0.001));
  rocky.setScale(scale).moveTowards(mouseX, mouseY).rotateTowards(mouseX, mouseY).drawIt();
}

class Raccoon {
  float x, y, rotationAngleInRadians, scale;

  Raccoon(float x_, float y_) {
    x = x_;
    y = y_;
    scale = 1;
  }

  void drawIt() {
    translate (x, y);
    rotate(rotationAngleInRadians);
    //draw body
    fill(#655B39);
    ellipse(0, -45*scale, 65*scale, 115*scale);
    //draw nose
    fill(#655B39);
    float eyeDiameter = width / 30 * scale;

    float noseDiameter = 1 * eyeDiameter;
    triangle(-25*scale, 0, 25*scale, 0, 0, 50*scale);
    //draw eyes
    fill(#FFFFCC);
    ellipse(0 - eyeDiameter/2, 0, eyeDiameter, 2 * eyeDiameter);
    ellipse(0 + eyeDiameter/2, 0, eyeDiameter, 2 * eyeDiameter);
    //draw pupils
    fill(0);
    float pupilDiameter = 0.6 * eyeDiameter;
    ellipse(0 - eyeDiameter/2, 0, pupilDiameter, pupilDiameter);
    ellipse(0 + eyeDiameter/2, 0, pupilDiameter, pupilDiameter);
    //draw tail
    fill(#655B39);
    ellipse(0, -210, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -220, -15*scale, 30*scale);
    fill(#655B39);
    ellipse(0, -230, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -240, -15*scale, 30*scale);
    fill(#655B39);
    ellipse(0, -250, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -260, -15*scale, 30*scale);
    fill(#655B39);
    ellipse(0, -270, -15*scale, 30*scale);
    fill(#9F9B8E);
    ellipse(0, -280, -15*scale, 30*scale);
  }
  Raccoon moveTowards(float toX, float toY) {
    float easing = 0.05;
    x = x + easing*(toX-x);
    y = y + easing*(toY-y);
    return this;
  }
  Raccoon rotateTowards(float pointToX, float pointToY) {
    //a bit of trig...
    rotationAngleInRadians = atan( (pointToY - y) / (pointToX - x) ) ;
    // because we drew our raccoon already rotated facing down...
    rotationAngleInRadians -= PI/2;

    //now, deal with the fact that atan may be off by 180 degrees,
    //so we may need to add PI radians
    if (pointToX == x) {
      if ( pointToY < y ) {
        rotationAngleInRadians += PI;
      }
      return this;
    }
    if (pointToX < x)
      rotationAngleInRadians += PI;
    return this;
  }
  Raccoon setScale(float s) {
    scale = s;
    return this;
  }
}

