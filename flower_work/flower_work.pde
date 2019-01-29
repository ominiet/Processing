void setup() {
  size(400, 400);
}
void draw() {
  background(255);
  translate(mouseX, mouseY);

  for (int i =0; i < 5; i++) {
    fill(#ffbdc7);
    ellipse(0, -30, 50, 50);
    rotate(2*PI/5);
  }
  
  arc(0, -30, 50, 50, PI/2, 3*PI/2);
  fill(#FFFF66);
  ellipse(0, 0, 35, 35);
}