//Oscar Miniet

float angle;
void setup(){
size(400,400);
angle = 0;
fill(0);
}
void draw(){
  background(255);
  translate(width/2,height/2);
  rotate(angle);
  rect(0,0,25,100);
  angle += .02;
}