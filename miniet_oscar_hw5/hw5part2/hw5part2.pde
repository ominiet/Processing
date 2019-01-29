/*
*Oscar Miniet
*1212-1704
*Sketch displays function as required. Sketch will crash when float size limit is reached
*has personal function created as myFunc
*getSection produces a section of the function that is the width of the screen to display
*function is drawn by closely placed circles
*each frame, the inputs are shifted right by .1
*/

float x1, x2;

float myFunc(float in){
  return (cos(in/50)*30  + sin(in/10)*50 - in / 40);
}

void getSection(float x1,float x2){
  translate(0,height/2);
  fill(255);
  for (float i = x1; i < x2; i += .2){  //make dependent on width
    ellipse(i-x1,myFunc(i),7,7);
  }
}

void setup(){
  size(400,400);
  noStroke();
  x1 = 42.5;
  x2 = x1 + width;
  smooth();
}

void draw(){
  background(0);
  getSection(x1,x2);
  x1 +=.1;
  x2 +=.1;
}
  