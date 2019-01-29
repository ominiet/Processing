//Oscar Miniet
//1212-1704
//circles will be recursively drawn (4 smaller in each bigger circle)
//colors will be determined by the radius

void drawCircle(int x, int y, int radius){
  stroke(radius*.75, 200,200);
  ellipse(x,y,radius*2,radius*2);
 
 if (radius > 40){
   drawCircle(x-radius/2,y,radius /2);
   drawCircle(x,y-radius/2,radius /2);
   drawCircle(x+radius/2,y,radius /2);
   drawCircle(x,y+radius/2,radius /2);
 }
}
void setup(){
  size(400,400);
  background(255);
  noFill();
  smooth();
  colorMode(HSB);
}
void draw(){
  drawCircle(width/2,height/2,width/2);
}