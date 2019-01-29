import processing.sound.*;
SoundFile file;
PImage yodelkid;

int rate;

color[] colors;

void setup() {
  size(400, 400);
  background(0);
  rectMode(CENTER);
  frameRate(60);

  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "walmart_sound.mp3");
  file.play();
  yodelkid =  loadImage("yodel_kid.jpg");
  imageMode(CENTER);
  
  rate = 600;
  colors = new color[3];
  colors[0] = color(0);
  colors[1] = color(200,0,0);
  colors[2] = color(0,0,200);
  
}      

void draw() {
  image(yodelkid, width/2, height/2);
   if (frameCount %rate == 0){
     background (colors[(int)random(0,3)]);
     rate = 30;
   }
  
  /*a
  strokeWeight(1);
  fill(#ffcd94);
  ellipse(width/2,height/2 -10,50,50);
  
  fill(230);
  rect(width/2,height/2 + 10,30,70);
  
  fill(200,0,0);
  
  
  
  triangle(width/2,height/2 + 1, width/2 - 10, height/2 -11,width/2 -10,height/2 +11 );
  triangle(width/2,height/2 + 1, width/2 + 10, height/2 +11,width/2 +10,height/2 -11 );
  ellipse(width/2, height/2 + 1, 10,10);
  */
}