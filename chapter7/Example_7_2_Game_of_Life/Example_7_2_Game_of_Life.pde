// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 7-2: Game of Life

int w = 8;
int columns, rows;
int[][] board;

void setup() {
  size(640, 360);
  columns = width / w;
  rows = height / w;
  board = create2DArray(columns, rows);
  for (int i = 1; i < columns - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      board[i][j] = (int) Math.floor(random(2));
    }
  }
}

void draw() {
  // The next board
  int[][] next = create2DArray(columns, rows);

  // Looping but skipping the edge cells
  for (int i = 1; i < columns - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      // Add up all the neighbor states to
      // calculate the number of live neighbors.
      int neighborSum = 0;
      for (int k = -1; k <= 1; k++) {
        for (int l = -1; l <= 1; l++) {
          neighborSum += board[i + k][j + l];
        }
      }
      // Correct by subtracting the cell state itself.
      neighborSum -= board[i][j];

      // The rules of life!
      if (board[i][j] == 1 && neighborSum < 2) next[i][j] = 0;
      else if (board[i][j] == 1 && neighborSum > 3) next[i][j] = 0;
      else if (board[i][j] == 0 && neighborSum == 3) next[i][j] = 1;
      else next[i][j] = board[i][j];
    }
  }

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      // evaluates to 255 when state is 0 and 0 when state is 1
      fill(255 - board[i][j] * 255);
      stroke(0);
      square(i * w, j * w, w);
    }
  }

  board = next;
}

int[][] create2DArray(int columns, int rows) {
  int[][] arr = new int[columns][rows];
  for (int i = 0; i < columns; i++) {
    arr[i] = new int[rows];
    for (int j = 0; j < rows; j++) {
      arr[i][j] = 0;
    }
  }
  return arr;
}
