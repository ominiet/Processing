size(320,180);
background(0);

//tree
fill(#2b1d0e);  //trunk
quad(0,0,50,0,50,180,0,180);
strokeWeight(2);  //lines
line(10,40,10,80);
line(30,90,30,120);
line(20,120,20,180);
line(5,95,5,140);
fill(#008000);
strokeWeight(0);  //leaves

ellipse(40,30,75,75);
ellipse(0,30,75,75);
ellipse(45,0,75,75);
fill(0);  //hole
ellipse(25,130,20,25);

strokeWeight(1);

//feet
fill(#FF8C00);
quad(120,180,130,170,150,170,150,180);//left
quad(200,180,190,170,170,170,170,180);//right

//body
fill(#654321);
ellipse(160,105,125,150);
ellipse(95,115,15,40);
ellipse(225,115,15,40);
fill(#f4a460);
ellipse(160,135,75,90);

//beak
fill(#FF8C00);
triangle(150,90,170,90,160,105);

//eyes
fill(255,255,255);
ellipse(135,75,50,50);
ellipse(185,75,50,50);
fill(0);
ellipse(140,80,10,10);
ellipse(180,80,10,10);

//moon
fill(#e8f4f8);
ellipse(300,20,120,120);

fill(#c1e1ec);
strokeWeight(0);
ellipse(300,10,20,20);
ellipse(280,55,20,25);
ellipse(320,40,30,20);
ellipse(265,20,20,25);