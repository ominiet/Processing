void setup() {
  size(640, 640);
  noFill();
  strokeWeight(4);
  stroke(255, 0, 0);
  noFill();
  //frameRate(5);
}
void draw() {
  background(255);
  translate(width/2, height/2);

  for (int i = 0; i < 20; i++) {
    rotate(TWO_PI/20);
    beginShape();
    for (float y = 0; y <=180; y += 4.5) {
      float x= sin(radians(y + frameCount)) * (5 + sin(radians(y)) * y/3);
      vertex(x, y+20);
    }
    for (float y = 180; y >=0; y -= 4.5) {
      float x= sin(radians(y + frameCount)) * (5 + sin(radians(y)) * y/3);
      x *= -1;
      vertex(x, y+20);
    }
    endShape();
  }
}