
float t = 0;

void setup(){
  size(400,400);
}

void draw(){
  float x,y;
  float a = cos(t);
  y = 200 * cos(a) + height/4;
  x = 200 * sin(a) + width/2;
  background(255);
  fill(0);
  line(200,100,x,y);
  ellipse(x,y,20,20);
  t += .05;
}