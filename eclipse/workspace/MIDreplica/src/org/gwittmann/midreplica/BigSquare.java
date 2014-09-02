package org.gwittmann.midreplica;

//import org.gwittmann.midreplica.MIDreplica.BigSquare;
import org.gwittmann.midreplica.MIDreplica.Food2;

import processing.core.PApplet;

public class BigSquare {
	private PApplet app;
	float x, y, rotationAngleInRadians, bigSquareScale;

	BigSquare(PApplet app_, float x_, float y_) {
		x = x_;
		y = y_;
		bigSquareScale = 1;
		app = app_;
	}

	int zeroTo255() {
		int value = app.frameCount % 512;
		if (value < 256) {
			return value;
		}
		return 511 - value;
	}

	void drawItt() {
		app.pushMatrix();
		translate(x, y);
		square2.setFill(color(255, zeroTo255()));
		shape(square2, 25, 25);
		popMatrix();
	}

	void setScale(float s) {
		bigSquareScale = s;
	}

	BigSquare moveTowardsClosestFood2() {
		Food2 closestFood2 = null;
		float closestDistance = 9999999;
		for (Food2 food2 : food2s) {
			float d = dist(x, y, food2.x, food2.y);
			if (d < closestDistance) {
				closestFood2 = food2;
				closestDistance = d;
			}
		}
		moveTowards(closestFood2);
		return this;
	}

	BigSquare moveTowards(Food2 f) {
		float easing = (float) 0.04;
		x = x + easing * (f.x - x);
		y = y + easing * (f.y - y);
		float d = dist(x, y, f.x, f.y);
		if (d < 25)
			f.move();

		return this;
	}
}
