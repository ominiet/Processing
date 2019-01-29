void setup(){
  size(700,700);
  background(255);
}
void draw(){
  int rand = ((int)random(15)+5);
  fill(random(255),random(255),random(255));
  ellipse(random(10,690),random(10,690),rand,rand);
}