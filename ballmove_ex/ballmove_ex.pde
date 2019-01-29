int x = 5,s=2;
int y = 200,sy = 2; 

void setup(){
  size(400,400);
}
void draw(){
  background(255);
  fill(0);
  ellipse(x,y,10,10);
  x+=s;
  y+=sy;
  if(x + 5 > width || x - 5 < 0)
    s = -s;
   if(y + 5 > height || y - 5 < 0)
     sy = -sy;
}