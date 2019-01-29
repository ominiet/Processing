//question2
//Oscar Miniet
void setup() {
  size(400, 400);
  strokeWeight(2);
  
}

void draw(){
  background(100);
  for (int i = 0; i < 10; i++){
    for (int j = 0; j < 5; j ++){
      drawFish(i*width/10,j*height/5); 
      resetMatrix();
    }
  }
}

void drawFish(float cx, float cy)
{
  translate(cx, cy);

  beginShape();
  // The shape, made from openprocessing.org/sketch/162912
  for (int i = 0; i < 180; i+=5) {
    float x = sin(radians(i)) * i/15;
    float angle = sin(radians(i)) * 10;
    vertex(x-angle, i*0.4);
  }
  for (int i = 180; i > 0; i-=5) {
    float x = sin(radians(i)) * i/15;
    float angle = sin(radians(i)) * 10;
    vertex(-x-angle, i*0.4);
  }
  endShape(CLOSE);
}