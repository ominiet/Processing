//Oscar Miniet
//Q2

void setup() {
  size(600, 300);

  background(255);
  stroke(0);
  
  noFill();

  // TODO: call drawPattern method
  drawPattern(width/2, height, 300);
}

void drawPattern(float x, float y, float s) {
  // TODO: draw pattern at x, y, position of size s
  // Details: if s is small, draw the triangle (rectangle is also OK)
  // otherwise, call drawPattern recursively (three times)
  if (s < 4){
    triangle(x,y - s,x + s/2,y, x - s/2,y);
  }
  else {
    drawPattern(x-s/4,y,s/2);
    drawPattern(x + s/4, y,s/2);
    drawPattern(x,y - s/2, s/2);
  }
}