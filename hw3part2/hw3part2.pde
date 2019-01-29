/* Oscar Miniet

both balls have different logic

Ball 1 changes direction when it hits a boundary or the square

Ball 2 has 6 states that allow it to travel around the block and screen
*/

int ball1x = 2;
int ball1y = 1;
int ball1xlocation = 5, ball1ylocation = 35;

int ball2x = 1;
int ball2y = 0;
int ball2xlocation = 35, ball2ylocation = 5;
int state;

void setup() {
  size(300, 300);
  state = 1;
  fill(0);
}
void draw() {
  background(255);
  rect(0, 0, 30, 30);
  ellipse(ball1xlocation, ball1ylocation, 10, 10);
  ball1xlocation += ball1x;
  ball1ylocation += ball1y;
  if (ball1xlocation > width -5 || ball1xlocation < 5) {
    ball1x *= -1;
  }
  if (ball1ylocation > height -5 || ball1ylocation < 5) {
    ball1y *= -1;
  }
  if (ball1ylocation == 35 && ball1xlocation < 35) {
    ball1y *= -1;
  }
  if (ball1xlocation == 35 && ball1ylocation < 35) {
    ball1x *= -1;
  }
  ellipse(ball2xlocation, ball2ylocation, 10, 10);

  switch (state) {
  case 1:
    if (ball2xlocation >= width - 5) {
      state ++;
      ball2x = 0;
      ball2y = 1;
    }
    break;
  case 2:
    if (ball2ylocation >= height - 5) {
      state ++;
      ball2x = -1;
      ball2y = 0;
    }
    break;
  case 3:
    if (ball2xlocation <= 5) {
      state ++;
      ball2x = 0;
      ball2y = -1;
    }
    break;
  case 4:
    if (ball2ylocation <= 35) {
      state ++;
      ball2x = 1;
      ball2y = 0;
    }
    break;
  case 5:
    if (ball2xlocation >= 35) {
      state ++;
      ball2x = 0;
      ball2y = -1;
    }
    break;
  case 6:
    if (ball2ylocation <= 5) {
      state = 1;
      ball2x = 1;
      ball2y = 0;
    }
    break;
  }
  ball2xlocation += ball2x;
  ball2ylocation += ball2y;
}