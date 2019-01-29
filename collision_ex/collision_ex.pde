int x1, y1;
int vx1, vy1;
int x2, y2;
int vx2, vy2;
int t0;

void setup() {
  
  size(400,400);
  x1 = 40; y1 = 360;
  x2 = 360; y2 = 360;
  vx1 = 1; vy1 = -1;
  vx2 = -1; vy2 = -1;
  t0 = x2-x1 -20 /2;
}

void draw(){
  
  background(255);
  //if (frameCount == t0;{
  //  vx1 = -1; vx2 = 1;
  //}
  //posteriori
  //detetction
  if(dist(x1,y1,x2,y2) <=20){
    
  //correction
    vx1 = -1; vx2 = 1;
  }
  
 // x1 += vx1;y1 += vy1;
  fill(200,0,0);
  ellipse(x1,y1,20,20);
  x1 += vx1; y1 += vy1;
  fill(0,0,200);
  ellipse(x2,y2,20,20);
  x2 += vx2; y2 += vy2;
}
  