int vx,vy;
float cx,cy;
int s;

int mode;

void setup(){
  mode = 1;
  size(400,400);
  background(200);
  s = 25;
  cx = s/2 + 1;
  cy = s/2 + 1;
  
  vx = 1;
  vy = 0;
}

void draw(){
  background(200);
  ellipse(cx,cy,s,s);
  cx += vx;
  cy += vy;
  
  if(cx >= width - s/2 && mode == 1) {
    vy = 1;
    vx = 0;
    mode =2;
  }
  if(cy >= height - s/2 && mode == 2){
    vy = 0;
    vx = -1;
    mode = 3;
  }
  if(cx <= s/2 && mode == 3){
    vx = 0;
    vy = -1;
    mode = 4;
  }
  
  if(cy <= s/2 && mode == 4){
    vy = 0;
    vx = 1;
    //cx = s/2+1;
    //cy = s/2+1;
    mode = 1;
  }
}