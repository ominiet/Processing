//Oscar Miniet
//Question 1

int sx1 = 1;
int sy1 = -1;
int sx2 = -1;
int sy2 = -1;

int radius = 10;
int x1, y1, x2, y2;

color c1 = color(152, 45, 70);
color c2 = color(50, 112, 225);

void setup()
{
    size(200, 200);
    background(180);  
    x1 = radius;
    y1 = height - radius;
    x2 = width - radius;
    y2 = height - radius;

    smooth();
    noStroke();
}

void draw()
{
    background(180);  

  // TODO: move two balls using posteriori method 
    x1 += sx1;
    y1 += sy1;
    x2 += sx2;
    y2 += sy2;
    
    if (dist(x1,y1,x2,y2) < radius /*misleading variable name*/){
      sx1 *= -1;
      sx2 *= -1;
      
      x1 += sx1;  //adjust so balls are not inside of each other even for a frame
      x2 += sx2;
    }
    


    fill(c1);
    ellipse(x1, y1, radius, radius);
    fill(c2);
    ellipse(x2, y2, radius, radius);
}