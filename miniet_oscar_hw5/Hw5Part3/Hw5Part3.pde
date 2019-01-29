//Oscar Miniet
//1212-1704
//Inverts image back and forth to create a white wolf at night from a black wolf in the day

PImage img;
boolean inverting;
float [] pixelChanges;
int frames;

color shiftPixel(color currentPix, float stepSize) {  //moves a pixel color by desired amount
  float red = red(currentPix)+ stepSize;
  float green = green(currentPix) + stepSize;
  float blue = blue(currentPix) + stepSize;

  return color(red, green, blue);
}
int getGrayAvg(color input) {  //gets image pixel in grayscale
  float red = red(input);
  float green = green(input);
  float blue = blue(input);

  int gray = (int)(red + green + blue)/3;
  return gray;
}

float[] generateStepSize(color[] pixs) {  //find necessary step per frame to invert color
  float[] steps = new float[pixs.length];
  float stepSize;
  for (int i = 0; i < pixs.length; i ++) {
    color temp = pixs[i];
    if (getGrayAvg(temp)>128) {
      stepSize = (255 -((255 - getGrayAvg(temp))*2)) / -50;
      steps[i] = stepSize;
    } else if (getGrayAvg(temp) < 128) {
      stepSize = (255 - (getGrayAvg(temp))*2) / 50;
      steps[i] = stepSize;
    } else steps[i] = 0;
  }
  return steps;
}

void setup() { 
  size(450, 330);
  img = loadImage("grayscalewolf.jpg");
  frames = 0;
  pixelChanges = generateStepSize(img.pixels);
  frameRate(10);
  inverting = true;  
}
void draw() {
  background(img);
  
  if (inverting) {//move foward if inverting colors and backwards if uninverting
    for (int i = 0; i < img.pixels.length; i ++) {
      img.pixels[i] = shiftPixel(img.pixels[i], pixelChanges[i]);
    }
  }
  else {
    for (int i = 0; i < img.pixels.length; i ++) {
      img.pixels[i] = shiftPixel(img.pixels[i], -pixelChanges[i]);
    }
  }
  
  
  frames ++;  //handles forward and backward motion of image changing colors
  if (frames >= 50) {
    inverting = !inverting;
    frames = 0;
  }
}