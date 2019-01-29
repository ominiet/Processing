/*Oscar Miniet

Gridlines drawn in setup function
Mouse logic will go in nested for loops in draw function

Every square must be redrawn each frame so that way 
squares unhighlight when mouse leaves the area
/*
void setup() {
  size(600, 600);
  background(255);
  strokeWeight(5);
  
  line(width/3, 0, width/3, height);    //vertical lines
  line(width/3*2, 0, width/3*2, height);

  line(0, height/3, width, height/3);   //horizontal lines
  line(0, height/3*2, width, height/3*2);
}

void draw() {
  for (int i = 0; i <3; i++){
    for(int j = 0; j < 3; j++){
      if(mouseX > width/3*i && mouseX < width/3*(i+1) &&
        mouseY > height/3*j && mouseY < height/3*(j+1)){
        fill(150);  //if mouse is in range highlight
      }
      else{
        fill(255);  //else fill with white
      }
      rect(width/3*i,height/3*j,width/3,height/3);  //clean or highlight tile
    }
  }
}