color[] c = new color[10];
int[][] cIndex = new int[10][10];

// generate 10 colors
for (int i = 0; i < c.length; i ++){
  c[i] = color(random(0,255),random(0,255),random(0,255));
}
// generate cIndex from 0 to 9
for (int i = 0; i < cIndex.length; i++){
  for (int j = 0; j < cIndex[i].length;j++){
    cIndex[i][j] = (int)(random(0,10));
  }
}
//draw the balls using the color

size(400,400);
background(255);
noStroke();
int gSize = width/cIndex.length;
for (int i = 0; i < cIndex.length; i++){
  for (int j = 0; j < cIndex[i].length;j++){
    fill(c[cIndex[i][j]]);
    ellipse(j*gSize + gSize/2,i*gSize + gSize/2,gSize,gSize);
  }
}