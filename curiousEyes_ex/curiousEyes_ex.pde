void setup(){
  size(400,400);
}
void draw() {
  background(100);
  fill(255);
  noStroke();
  ellipse(100,100,100,100);
  fill(0);
  float a = atan2(mouseY-100,mouseX - 100);
  translate(100,100);
  rotate(a);
  ellipse(25,0,50,50);
  
  resetMatrix();
  fill(255);
  noStroke();
  ellipse(300,100,100,100);
  fill(0);
  a = atan2(mouseY-100,mouseX - 300);
  translate(300,100);
  rotate(a);
  ellipse(25,0,50,50);
}