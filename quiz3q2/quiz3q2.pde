PImage img ;
int mx;
int my;
color mycolor;
void setup(){
  size(200,200);
  img = loadImage("sunflower.jpg");
  
}
void draw(){
  background(img);
  mx = mouseX;
  my = mouseY;
  
  mycolor = img.pixels[my*width + mx];
  fill(mycolor);
  ellipse(mx,my,10,10);
}