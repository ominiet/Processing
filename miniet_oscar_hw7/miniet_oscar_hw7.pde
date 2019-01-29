/*Oscar Miniet
 *1212-1704
 *
 *Create Clock class and use that to display a working clock
 *setup will initialize the object and draw will call display function
*/

PFont f;
Clock c;

class Clock {

  void display() {
    stroke(0);
    strokeWeight(1);
    background(0);
    fill(255);
    translate(width/2, height/2);
    pushMatrix();
    ellipse(0, 0, width, height);
    fill(0);
    ellipse(0, 0, 5, 5);


    for (int i = 0; i <= 60; i ++) {

      if (i %5 == 0) {
        rect(0, height/2 - 15, 5, 15, 7); //bigger tick for quarter hour
      }
      rect(0, height/2 -15, 2, 10, 7);
      rotate(TWO_PI/60);
    }
    popMatrix();
    drawNumbers();
    drawHands();
  }
  void drawNumbers() {
    for (float i = 1; i <= 12; i ++) {
      text((int)i, 165 * sin(i/12.0 * TWO_PI), -165 * cos(i/12.0 * TWO_PI));
    }
  }
  void drawHands() {

    strokeWeight(7);//hours
    line(0, 0, 100  * cos(((hour()/12.0 + minute()/60.0/12.0 + second()/60.0/60.0/12.0  )* TWO_PI) - PI/2), 100  * sin(((hour()/12.0 + minute()/60.0/12.0 + second()/60.0/60.0/12.0 ) * TWO_PI)- PI/2));

    stroke(0);  //minutes
    strokeWeight(3);
    line(0, 0, 150  * cos(((minute()/60.0 + second()/60.0/60.0)  * TWO_PI) - PI/2), 150  * sin(((minute()/60.0 + second()/60.0/60.0 ) * TWO_PI)- PI/2));

    strokeWeight(2);//seconds
    stroke(200, 0, 0);
    line(0, 0, 150  * cos((second()/60.0  * TWO_PI) - PI/2), 150  * sin((second()/60.0  * TWO_PI)- PI/2));
  }
}

void setup() {
  size(400, 400);
  f = loadFont("Courier-Bold-32.vlw");
  textSize(32);
  textFont(f);
  textAlign(CENTER, CENTER);
  frameRate(60);
  c = new Clock();
}

void draw() {
  c.display();
}