void setup() 
{ 
size(200, 200); 
frameRate(5); 
} 

void draw() 
{

  float r;
// generate a random number and set it as r

  r = random(0, 100) - 50.0;
  print(r);

 

// based on r, draw the ellipse with corresponding color
  if(r < 0.5){
    fill(0);
  }
  else{
    fill(255);
  }
  ellipse(width/2,height/2,50,50);
  
} 



////Question 2

/// environment variables must be altered or question 2 must be put into a new file in order to run properly

int rects = 100;
float y;

float wid = width / rects;


size(400,400);
background(255);
fill(0);
translate(0,height/2);

for (int i = 0; i < rects; i ++){
  
  y = sin((float)i/2)*50;
  rect(i*wid,0,width/rects-2,y);
  
}