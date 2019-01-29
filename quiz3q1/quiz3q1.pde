size(200,200);

float [] myArr = new float[5];

for (int i = 0; i < myArr.length; i ++){//initialize array
  myArr[i] = random(20,51);
}

for (int i = 0; i < myArr.length; i ++){
  ellipse(random(25,175),random(25,175),myArr[i],myArr[i]);
}