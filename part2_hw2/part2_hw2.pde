//100 resizable squares so that are continuous shades of the color spectrum

size(600,400);
background(255);
colorMode(HSB);

float col = 2.55;
int xl = 0;
int yl = 0;

for (int i = 0; i < 11; i++){
  col +=2.55;
  fill (col,255,255);
  rect(xl,yl,width/10,height/10);
  xl += width/10;
  if (yl <= height && i == 10){
    yl += height / 10;
    xl = 0;
    i = 0;
  }
}