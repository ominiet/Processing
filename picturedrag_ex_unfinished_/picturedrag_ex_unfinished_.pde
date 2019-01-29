int sx, sy;
int ex, ey;
boolean picked;
boolean locked;
int bdifx;
int bdify;

void mousePressed(){
  if(!picked){
    sx = mouseX;
    sy = mouseY;
  }
  else if (picked) {
    if(!locked && mouseX > sx && mouseX < ex && mouseY > sy && mouse < ey){
      locked = true;
      bdifx = mouseX - sx;
      bdify = mouseY - sy;
    }
  }
}

void mouseReleased(){
  if(!picked){
    sx = mouseX;
    sy = mouseY;
  }
  else {
    sx = mouseX;
    sy = mouseY;
    picked = false;
  }
}