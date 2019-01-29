void setup() {
  size(400, 400);
}
void draw() {
  background(255);
  if (mouseX > 200 && mouseX < 300 && mouseY > 100 && mouseY < 200) {
    fill(255, 0, 0);
  } else
    fill(0, 0, 255);
  rect(200, 100, 100, 100);
}