public int i = 0;
public int stay = 0;
void setup() {
  size(320, 180);
  textSize(32);
  rectMode(CENTER);
  frameRate(25);
}
void draw() {
  background(50);
  //tree
  fill(#2b1d0e);  //trunk
  quad(0, 0, 50, 0, 50, 180, 0, 180);
  strokeWeight(2);  //lines
  line(10, 40, 10, 80);
  line(30, 90, 30, 120);
  line(20, 120, 20, 180);
  line(5, 95, 5, 140);
  fill(#008000);
  strokeWeight(0);  //leaves

  ellipse(40, 30, 75, 75);
  ellipse(0, 30, 75, 75);
  ellipse(45, 0, 75, 75);
  fill(0);  //hole
  ellipse(25, 130, 20, 25);

  strokeWeight(1);

  //feet
  fill(#FF8C00);
  quad(120, 180, 130, 170, 150, 170, 150, 180);//left
  quad(200, 180, 190, 170, 170, 170, 170, 180);//right

  //body
  fill(#654321);
  ellipse(160, 105, 125, 150);

  fill(#f4a460);
  ellipse(160, 135, 75, 90);

  //beak
  fill(#FF8C00);
  triangle(150, 90, 170, 90, 160, 105);

  //eyes
  fill(255, 255, 255);
  ellipse(135, 75, 50, 50);
  ellipse(185, 75, 50, 50);
  fill(0);
  ellipse(140, 80, 10, 10);
  ellipse(180, 80, 10, 10);

  //moon
  fill(#e8f4f8);
  ellipse(300, 20, 120, 120);

  fill(#c1e1ec);
  strokeWeight(0);
  ellipse(300, 10, 20, 20);
  ellipse(280, 55, 20, 25);
  ellipse(320, 40, 30, 20);
  ellipse(265, 20, 20, 25);
  
  
  //wings and glasses
  
  fill(0);
  if (i <= 100) {
    rect(160, -35 + i, 120, 10);
    ellipse(130, -25 + i, 60, 35);
    ellipse(190, -25 + i, 60, 35);
  }
  if(i == 100){
    stay ++;
    fill(255,0,0);
    text("Hoo Cares",80,32);
  }
  else i ++;
  if (stay > 50 ) {
    i = 0;
    stay = 0;
  }
  
  pushMatrix();  //95, 115
  
  translate(98,100);
  rotate((float)(i)/ 100.0 * (4 * PI/6));
  fill(#654321);
  ellipse(0, 20, 16, 40);
  
  popMatrix();
  //right wing
  pushMatrix();
  
  translate(221,100);//225,95
  rotate((float)(i)/ 100.0 * (4 * PI/6));
  ellipse(0, 20, 16, 40);
  popMatrix();
  
}