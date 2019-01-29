int [][] myArray = new int[10][10];

for (int y = 0; y < myArray.length; y++) {
  for (int x = 0; x < myArray[y].length; x++) {
    myArray[y][x] = int(sin(x+y)*128 + 128);
  }
}

size(400, 400);
stroke(255);

int gSize = width/myArray.length;
for (int y = 0; y < myArray.length; y++) {
  for (int x = 0; x < myArray[y].length; x++) { 
    fill(myArray[y][x]);
    rect(x*gSize, y*gSize, gSize, gSize);
  }
}