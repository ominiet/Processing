size(360, 480);
background(0);
smooth();
fill(#33ff00);


for (int i = 0; i < 100; i ++) {
  for (int j = 0; j < 100; j ++) {
    text((int)random(0, 2), i * 10, j * 10);
  }
}

rectMode(CENTER);
fill(0);
rect(width/2,100,300,100);
fill(#33ff00);

text("UF CISE",width/2,100,300,100);