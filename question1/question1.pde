//question 1
// put your name here:Oscar Miniet
//1212-1704

moveObj obj = new moveObj(10, 10, 10, 10);
// TODO: create another object of the moveObj class at different location

moveObj ob2 = new moveObj(10,200,10,200);

 
void setup()
{
  size(640, 360);
  fill(100);
 }
 
void draw()
{
  background(255);
  obj.display();
  obj.move();
  ob2.display();
  ob2.move();
  
   
}
 
class moveObj {
  float w; // rect width
  float xpos; // rect xposition
  float h; // rect height
  float ypos ; // rect yposition
 
  moveObj(float iw, float ixp, float ih, float iyp) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
   }
 
  void move () {
   if (mouseX > xpos){
     xpos ++;
   }
   else if(mouseX < xpos){
     xpos --;
   }
   if (mouseY > ypos){
     ypos ++;
   }
   else if(mouseY < ypos){
     ypos --;
   }
  }
 
  void display() {
      rect(xpos, ypos, w, h);
  }
}