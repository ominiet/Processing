void setup() {
  size(700, 700);
}

void draw() {
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, 6, 6);
  }
}