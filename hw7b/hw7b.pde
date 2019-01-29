// Oscar Miniet
// 1212-1704
//Class of Ball with draw, update and check collision function 
//when collision happens the response might not send balls in exact directions
//approximate new directions calculated

class Ball{  
  float x, y;
  int radius;
  
  float xv,yv;
  color c;
  
  Ball(int x, int y){
    
    this.x = x;
    this.y = y;
    this.radius = 10;
    xv = 1;
    yv = -1;

    c = color(0,0,200);
  }
  void drawBall(){
    fill(c);
    ellipse(x,y,radius *2, radius*2);
  }
  void checkCollision(Ball b){
    
    if(dist(x,y,b.x,b.y) <= (radius + b.radius)){

      //get collision point
      float cPointx = ((float)x + (float)b.x)/2;  //all balls are same size so collision point is 
      float cPointy = ((float)y + (float)b.y)/2;
      
      //find vector in direction of collision point from center and rotate
      
      line(x,y,cPointx,cPointy);
      xv = cPointy - y;
      yv = (cPointx - x);
      yv*=-1;
      
      b.xv = cPointy - b.y;
      b.yv = (cPointx - b.x);
      b.yv*=-1;
     
      
      //normalize
      float mag = sqrt(xv*xv + yv*yv);
      xv /= mag;
      yv /= mag;
      
      mag = sqrt(b.xv*b.xv + b.yv*b.yv);
      b.xv /= mag;
      b.yv /= mag;
      
      
      //rescale to original magnitude
      
      xv *= sqrt(2);  //magnitude of <1,1>
      yv *= sqrt(2);
      b.xv *= sqrt(2);  //magnitude of <1,1>
      b.yv *= sqrt(2);
      
      x += xv;
      y += yv;
      b.x += b.xv;
      b.y += b.yv;
      
    }
  }
  void update(){  //adjust trajectory if there is a collision with the bounding box
    if(x - radius <= 0)xv *= -1;
    if(x + radius >= width) xv *=-1;
    if(y - radius <= 0) yv*=-1;
    if(y + radius >= height) yv*=-1;
    x += xv;
    y += yv;
    
  }
}

Ball[] b;  //create array of balls variable

void setup(){
  size(200,200);
  b = new Ball[3];//initialize array with randomly placed balls
  for (int i = 0; i < b.length; i++){
    b[i] = new Ball((int)random(10,191),(int)random(10,191));
  }
}
void draw(){
  background(255);
  
  for (Ball i: b){
    i.drawBall();  //draw balls
  }
  
  b[0].checkCollision(b[1]);  //check collisions
  b[0].checkCollision(b[2]);
  b[1].checkCollision(b[2]);
  
  for (Ball i: b){  //update positions of balls
    i.update();
    
  }
  
}