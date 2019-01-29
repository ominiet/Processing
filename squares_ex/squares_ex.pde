void setup(){
  size(300,300);
  background(255);
  rectMode(CENTER);
}
void draw(){
  int x = 0,shade = 0;
  for (int i = 0; i < 4; i ++){
     fill(shade);
     rect(50 + x,50 + x, 20, 20); 
     x += 10;
     shade +=50;
  }
}