// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 7-3: Object-Oriented Game of Life

int w = 8;
int columns, rows;
Cell[][] board;

void setup() {
  size(640, 360);
  columns = width / w;
  rows = height / w;
  board = create2DArray(columns, rows);
  for (int i = 1; i < columns - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      board[i][j] = new Cell((int) Math.floor(random(2)), i * w, j * w, w);
    }
  }
}

void draw() {
  // Looping but skipping the edge cells
  for (int x = 1; x < columns - 1; x++) {
    for (int y = 1; y < rows - 1; y++) {
      int neighborSum = 0;
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          // Use the previous state when counting neighbors
          neighborSum += board[x + i][y + j].previous;
        }
      }
      neighborSum -= board[x][y].previous;

      // Set the cell's new state based on the neighbor count
      if (board[x][y].state == 1 && neighborSum < 2) {
        board[x][y].state = 0;
      } else if (board[x][y].state == 1 && neighborSum > 3) {
        board[x][y].state = 0;
      } else if (board[x][y].state == 0 && neighborSum == 3) {
        board[x][y].state = 1;
      }
      // else do nothing!
    }
  }

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      // evaluates to 255 when state is 0 and 0 when state is 1
      board[i][j].show();

      // save the previous state before the next generation!
      board[i][j].previous = board[i][j].state;
    }
  }
}

Cell[][] create2DArray(int columns, int rows) {
  Cell[][] arr = new Cell[columns][rows];
  for (int i = 0; i < columns; i++) {
    arr[i] = new Cell[rows];
    for (int j = 0; j < rows; j++) {
      arr[i][j] = new Cell(0, i * w, j * w, w);
    }
  }
  return arr;
}
