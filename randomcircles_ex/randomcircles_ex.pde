size(400,400);
background(255);
noStroke();
for (int r = 0; r < 10; r++){
  for (int c = 0 ; c < 10; c ++){
    fill(random(255), random(255),random(255));
    ellipse(20 + c * 40,20 + r * 40,40,40);
  }
}