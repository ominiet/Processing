class Board {
  int[][]board = new int[3][3];
  int gSize, s;
  boolean sym = true, game;

  Board() {
    board = new int[3][3];
    gSize = width/3;
    s = 30;
  }

  void initGame() {
    for (int i = 0; i < board.length; i ++) {
      for (int j = 0; j < board[i].length; j ++) {
        board[i][j] = 0;
      }
    }
    sym = true;
    game = true;
  }

  void drawBoard() {
    strokeWeight(5);
    stroke(100);
    line(200, 0, 200, height);
    line(400, 0, 400, height);
    line(0, 200, width, 200);
    line(0, 400, width, 400);

    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[i].length; j++) {
        if (board[i][j] == 1) {
          line(j*gSize+s, i*gSize+s, (j+1)*gSize-s, (i+1)*gSize-s);
          line((j+1)*gSize-s, i*gSize+s, j*gSize+s, (i+1)*gSize-s);
        } else if (board[i][j] == 2) {
          noFill();
          ellipse((j+0.5)*gSize, (i+0.5)*gSize, gSize - 2*s, gSize - 2*s);
        }
      }
    }
  }
  void displayMessage() {
    int r = checkEOG();
    if (r > 0) {
      fill(255, 124);
      rect(0, 0, width, height);
      fill(0);
      text("End of Game", 150, height/2);
      game = false;
    } else if (r<0) {
      fill(255, 124);
      rect(0, 0, width, height);
      fill(0);
      text("Tie", 250, height/2);
      game = false;
    }
  }

  void setPiece(int x, int y) {
    if (game && board[y][x] == 0) {
      board[y][x] = (sym)?1:2;
      sym = !sym;
    }
  }
  int checkEOG() {
    for (int i=0; i<board.length; i++) {
      if ((board[i][0] == board[i][1]) && (board[i][2] == board[i][1]))
        return board[i][0];
    }
    for (int i=0; i<3; i++) {
      if ((board[0][i] == board[1][i]) && (board[2][i] == board[1][i]))
        return board[0][i];
    }
    if ((board[0][0] == board[1][1]) && (board[2][2] == board[1][1]))
      return board[0][0];
    if ((board[2][0] == board[1][1]) && (board[0][2] == board[1][1]))
      return board[2][0];

    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[i].length; j++) {
        if (board[i][j] == 0) 
          return 0;
      }
    }

    return -1;
  }
}