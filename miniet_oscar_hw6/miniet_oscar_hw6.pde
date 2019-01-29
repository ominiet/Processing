/*Oscar Miniet
 *1212-1704
 *Typing game with two difficulties
 *Game will feature two racing cars with the player input controlling one
 *Game ends when gas reaches 0 and player score is listed
*/
int state;
char[][] keyboard = {{'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'}, 
  {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'}, 
  {'Z', 'X', 'C', 'V', 'B', 'N', 'M'}};//holds keys for keyboard initialization
  
line[] roadLines = new line[6];
car player;
car opponent;
int m;
boolean faster;
int spawnSpeed,opponentChoiceSpeed; 
int gas;
float gasMax;
int gasAdder;

ArrayList<letter> list = new ArrayList<letter>();//list of letters ready for player to press

class letter {  //letter and image associated with it
  char c;
  int x, y;
  boolean del;
  letter(char c) {
    this.c = c;
    this.x = (int)random(30, width-30);
    this.y = (int)random(-40,-20);
    this.del = false;
  }
  void update() {
    y += 1;
    if (y >= 200) del = true;
  }
  
  void drawLetter() {
    fill(200, 0, 0);
    noStroke();
    rect(x, y, 30, 35, 3);
    fill(0);
    rect(x, y-17.5, 15, 5, 3);
    rect(x, y-25, 5, 15);
    rect(x + 7.5, y - 30, 10, 5);
    text(c, x, y-2);
    stroke(1);
    smooth();
  }
}

class car {  //movable car objects
  int x, y;
  int tx, ty; //target locations
  int score;
  PImage sprite;
  float speed;

  car(int x, int y, PImage sprite) {
    this.x = x;
    this.y = y;
    this.sprite = sprite;
    speed = 0;
    score = 0;
  }
  void drawCar() {
    image(sprite, x, y, sprite.width * .5, sprite.height * .5);
    update();
  }
  void drawCar(int px ,int py){
    image(sprite, px,py, sprite.width *.5, sprite.height*.5);
  }
  void update() {
    if (tx > x) x ++;
    else if (tx < x) x --;
  }
  void scoreUp(){
   score += 10; 
  }
  void scoreDown(){
    score -= 5;
  }
  void goFaster() {
    speed ++;
    tx = tx + width/15;
    scoreUp();
  }

  void goSlower() {
    speed --;
    tx = tx - width/15;
    scoreDown();
  }
}

class line {  //lines for making road move
  int x;
  int y; 
  float speed;

  line(int x, int y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  void drawLine() {
    fill(#fad201);
    rect(x, y, 30, 10);
  }
  void update() {
    x -= speed;
    if (x < - 15) x = width/5*6 - 15;
  }
  void checkButton(boolean right) {
    if (right && speed < 10) {
      speed ++;
    } else if (!right && speed > 1) {
      speed --;
    }
  }
}


boolean findInOptions() {
  for (int i = 0; i < list.size(); i++) {
    if (list.get(i).c == key) {
      list.remove(i);
      return true;
    }
  }

  return false;
}
void displayMenuScreen() {  //state 0
  fill(255);
  rect(width/2, height/2-15, 225, 50,7);
  rect(width/3,height/4*3, 100,50,7);
  rect(width /3*2, height/4*3, 100,50,7);
  fill(0);
  textSize(32);
  text("Typing Game", width/2, height/2-20);
  text("Easy", width/3, height/4*3);
  text("Hard", width/3*2, height/4*3);
  player.drawCar(25,50);
  opponent.drawCar(225,75);
}
void drawButton(int x, int y, char k) {  //create buttons for keyboard
  rectMode(CENTER);
  
  if (key-32 == k || key == k) {
    fill(255);
  } else {
    fill(50);
  }
  rect(x, y, 30, 30, 7);
  if (key-32 == k || key == k) {
    fill(50);
  } else {
    fill(255);
  }
  text(k, x, y);
}
void drawKeyboard(int x, int y) {  //create keyboard and make it look interactive
  fill(255);
  rect(x + 155, y + 50, 365, 150, 7);
  int[] rowOffsets = {0, 15, 40};
  for (int i = 0; i < keyboard.length; i++) {
    for (int j = 0; j < keyboard[i].length; j++) {
      drawButton( x + rowOffsets[i]+ j*35, y + i*35, keyboard[i][j]);
    }
  }
  fill(50);
  rect(x + 150, y + 105, 245, 30, 7);
}
void initGame(int ss, int os, int g, int ga){  //for choosing game modes
  spawnSpeed = ss;
  opponentChoiceSpeed = os;
  gas  = g;
  gasMax = (float)g;
  gasAdder = ga;
}

void drawGame() {  //draw main game pieces state 1
  textSize(12);
  drawKeyboard(45, 265);
  fill(255);
  rect(200, 120, 365, 210, 7);
  fill(#0b6623);
  rect (200, 205, 365, 40, 0, 0, 7, 7);
  rect(200, 102, 365, 41);
  fill (40);
  rect(200, 160, 365, 75);

  for (int i = 0; i < roadLines.length; i ++) {
    roadLines[i].drawLine();
    roadLines[i].update();
  }
  opponent.drawCar();
  player.drawCar();
  for (int i = 0; i < list.size(); i ++) {
    list.get(i).drawLetter();
    list.get(i).update();
    if (list.get(i).del == true) {
      list.remove(i);
      player.scoreDown();
    }
  }
  if (frameCount % spawnSpeed == 0) {
    char newChar = (char)random(97, 123);
    list.add(new letter(newChar));
  }
  if (frameCount % opponentChoiceSpeed == 0) {
    float x =random(100);
    if (x >= 30) opponent.goFaster();
    else opponent.goSlower();
  } 
  fill(0);
  text(("Player Score: " + player.score),70,30);
  text(("Opponent Score: " + opponent.score),310,30);
  text("Gas:" , 150,30);
  noFill();
  rect(width/2,30, 70, 12);
  rectMode(CORNER);
  fill(0,200,0);
  rect(width/2 - 35,30-6,(float)gas / gasMax * 70,12);
  rectMode(CENTER);
  noStroke();
  fill(#99badd);  //cover up edges so objects can't leave game window
  rect(8.25, 120, 17.5, 210);
  rect(width - 8.25, 120, 17.5, 210);
  rect(width/2, 7.5, width, 15);
  stroke(1);
}

void drawEndGame(){ //state 2
  fill(0);
  textSize(32);
  text(("Game Over!"),width/2,height/2-20);
  textSize(20);
  text(("Score: " + player.score),width/2,height/2 +10);
}
void addGas(int g){    //keeps the game going for a bit
 gas = gas + g;
 if (gas > gasMax) gas = (int)gasMax;
}

void keyPressed() {  //finds and acts upon according key press
  boolean isOption = findInOptions();
  if (isOption) {
    addGas(gasAdder);
    if (player.speed >=10) {
      //player.speed ++;
      for (int i = 0; i < roadLines.length; i ++) {
        roadLines[i].checkButton(true);
      }
      player.scoreUp();
    } else {
      player.goFaster();
    }
  } else {
    if (player.speed <= 0) {
      for (int i = 0; i < roadLines.length; i ++) {
        roadLines[i].checkButton(false);
        
      }
      player.scoreDown();
    } else {
      player.goSlower();
    }
  }
}
void mouseClicked(){  //select difficulty in main state or quit if wanted
  if(mouseX >= width - 20 && mouseY <= 20){
    state = -1;
  }
  if(state == 0){
    if(mouseX >= (width/3-50) && mouseX < (width/3+50) &&
      mouseY >= (height/4*3 - 25) && mouseY <= (height/4*3 + 25)){
        initGame(120,200,1000,130);
        state = 1;
     }
    if(mouseX >= (width/3*2-50) && mouseX < (width/3*2+50) &&
      mouseY >= (height/4*3 - 25) && mouseY <= (height/4*3 + 25)){
       initGame(75,120,800,70);
       state = 1;
     }
  }
}
void setup() {
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  size(400, 400);
  frameRate(60);
  state = 0;
  for (int i = 0; i < roadLines.length; i++) {
    roadLines[i] = new line(i * width/5 + 15, 160, 1);
  }
  player = new car(20, 120, loadImage("spr_vintage_0.png"));
  opponent = new car (20, 100, loadImage("spr_turbo_0.png"));
}
void draw() {
  background(#99badd);
  if (state == 0) {
    displayMenuScreen();
  }
  else if(state == 1){
    drawGame();
    gas --;
    if(gas <= 0) state = 2;
  }
  else if(state == 2) {
    drawEndGame();
  }
  fill(200,0,0);
  rect(width-10, 10, 20,20);
  fill(0);
  textSize(10);
  text('X',width-10,10);
  if (state == -1)
    exit();
}