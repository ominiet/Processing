//Oscar Miniet
//Simple geometric background
//Computer will be at center
//On Computer it will be playing 'Pong'


boolean cursor = false;
int cursorCount = 50;

int bx = 50;
int by = 40;
int ballxV = 1;
int ballyV = 1;

int p1 = 0;
int p2 = 0;

float p1V = 1.2;
float p2V = 1.2;


void drawBackground(){
  noStroke();
  for (int i = 0; i <= width; i+=width/10){
    for(int j = 0; j <= height; j+=width/10){
    fill(0);
    triangle(i + width/20,j + width/20,i + width/10,j + width/10,i, j + width/10);
    fill(50);
    triangle(i,j,i + width/20,j+width/20,i,j + width/10);
    fill(100);
    triangle(i + width / 10,j,i + width/10,j+width/10,i + width / 20 ,j + width/20);
    fill(150);
    triangle(i,j,i + width/10,j,i+width/20,j + width/20);
    }
  }
  
}

void drawName(){
  fill(30);
   rect(36,36,36*8,36*3);
   fill(#33ff00);
   if (cursor){
   rect(280,50,40,72);
   }
   
   textSize(36*2);
   text("UF: CISE",6 * 6, 45.0*2.5);
   
   fill(30);
   rect(36 * 2,36 * 12,36 * 6, 36);
   
   fill(#33ff00);
   textSize(36*.75);
   text("Sign Up Now!",94,458);
}

void drawComputer(){
  fill(175);
  quad(160,330,200,330,220,400,140,400);
  
  fill(210);
  rect(40,185,280,170,7);
  rect(80,390,200,20,3);
  
  fill(0);      //screen
  ellipse(180,190,5,5);
  rect(50,195,260,150);
}

void drawGame(){
  fill(#33ff00);
  rect(60,195 + p1,10,30); //paddle 1
  rect(290,195 + p2,10,30);  //paddle 2
  
  rect(50 + bx,195 + by,8,8);    //ball
}

void setup(){
  size(360,480);
  smooth(); 
}

void draw(){
  drawBackground();  //draw elements
  drawName();
  drawComputer();
  drawGame();
  
  //update moving objects
  cursorCount --;
  
  bx += ballxV;
  by += ballyV;
  
  if(bx < 190){  //move paddles only if ball is close
    if(by > p1 + 15) p1 += p1V;  //prevents paddles from mirroring each other
    if(by < p1 + 15) p1 -= p1V;
  }
  if(bx > 55){
    if(by > p2 + 15) p2 += p2V;
    if(by < p2 + 15) p2 -= p2V;
  }
  if(p1 <= 0)p1 = 0;  //stop paddles from going off screen
  if(p2 <= 0)p2 = 0;
  if(p1 >= 120)p1 = 120;
  if(p2 >= 120)p2 = 120;
  
  if(bx < 0 || bx > 252){  //reset if ball goes off edge
   bx = 50;
   by = 40; 
  }
  
  if(bx == 20 && p1 <= by && p1 + 30 >= by){
    ballxV *= -1;
  }
  if(bx == 232 && p2 <= by && p2 + 30 >= by){
    ballxV *= -1;
  }
  
  if(by < 0 || by > 142){  //invert if it reaches bottom of screen
   ballyV *= -1; 
  }
  
  if(cursorCount == 0){
    cursor = !cursor;
    cursorCount = 50;
  }
}