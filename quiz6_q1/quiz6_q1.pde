// put your name here:Oscar Miniet
int lx = 10, ly = 10, rx=200;
int ry=200;
int vlx = 1, vly = 1, vrx = -1, vry = -1;

void setup() {
  size(300, 300);
}

void draw() {
  background(255);
  if(lx < 0 || lx > width/2)
   vlx = -vlx;
   if(ly < 0 || ly > height)
   vly = - vly;
   
  if(rx < width/2 || rx > width)
   vrx = -vrx;
  if(ry < 0 || ry > height)
   vry = - vry;

  lx += vlx;
  ly += vly;
  
  rx += vrx;
  ry += vry;
  
  ellipse(lx, ly, 5, 5);
  ellipse(rx, ry, 5, 5);
}