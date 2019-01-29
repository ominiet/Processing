//Oscar Miniet
//1212-1704
//background will change to blue according to amplitude
//this should happen when the doorbell sound is actually being played

import processing.sound.*;

SoundFile file;
Amplitude amp;

void setup(){
 size(300,300);
 file = new SoundFile(this, "doorbell.mp3");
 amp = new Amplitude(this);
 background(255);
 file.loop();
 amp.input(file);
}

void draw(){
  println(amp.analyze());
  if (amp.analyze() > 0.01){  //blue if there's sound 
    background(0,0,200);
  }
  else{
    background(0);  //black if the amplitude is low
  }
}