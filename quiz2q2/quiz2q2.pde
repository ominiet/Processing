int rects = 100;
float y;

float wid = width / rects;


size(400,400);
background(255);
fill(0);
translate(0,height/2);

for (int i = 0; i < rects; i ++){
  
  y = sin((float)i / (float)rects * TWO_PI *2.5) * 50;
  rect(i*wid,0,width/rects-2,y);
  
}