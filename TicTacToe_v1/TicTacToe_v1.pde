//int gSize, s;
Board b;

void setup() {
  size(600, 600);
  textSize(50);
  b = new Board();
  b.initGame();
}

void draw() {
  background(255);
  b.drawBoard();
  b.displayMessage();
  
}



void mousePressed() {
  // highlight
  int x = (int)mouseX/b.gSize;
  int y = (int)mouseY/b.gSize;
  b.setPiece(x,y);
}
void keyPressed(){
 if(key == 'r'){
   b.initGame();
 }
}