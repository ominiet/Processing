int [][] matrix = {{-1,-1,-1},
                    {-1,9,-1},
                    {-1,-1,-1}};

float [][] a = new float[100][100];
float[][] b = new float[100][100];
for (int i=0; i <a.length; i++) {
  for (int j=0; j < a[i].length; j++) {
    a[i][j] = random(255);
  }
}
loadPixels();
int ind = 0;
for (int i=1; i <a.length - 1; i++) {
  for (int j=1; j < a[i].length -1; j++) {
    b[i][j] = 0;
    for (int x=-1; x <= 1; x++) {
      for (int y =-1; y <= 1; y++) {
        b[i][j] += a[i+y][j+x] * matrix[y + 1][x + 1];
      }
    }
    pixels[ind] = color((int)b[i][j], 100, 100);
    ind++;
  }
}
updatePixels();