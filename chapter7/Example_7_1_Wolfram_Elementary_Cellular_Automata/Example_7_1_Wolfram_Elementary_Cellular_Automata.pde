// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 7-1: Wolfram Elementary Cellular Automata

// Array of cells
int[] cells;
// Starting at generation 0
int generation = 0;
// Cell size
int w = 10;

// Rule 90
int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};

void setup() {
  size(640, 320);
  background(255);
  // An array of 0s and 1s
  cells = new int[(int) Math.floor(width / w)];
  for (int i = 0; i < cells.length; i++) {
    cells[i] = 0;
  }
  cells[floor(cells.length / 2)] = 1;
}

void draw() {
  for (int i = 1; i < cells.length - 1; i++) {
    // Only drawing the cell's with a state of 1
    if (cells[i] == 1) {
      fill(0);
      // Set the y-position according to the generation.
      square(i * w, generation * w, w);
    }
  }

  // Compute the next generation.
  int[] nextgen = cells.clone();
  for (int i = 1; i < cells.length - 1; i++) {
    int left = cells[i - 1];
    int me = cells[i];
    int right = cells[i + 1];
    nextgen[i] = rules(left, me, right);
  }
  cells = nextgen;

  // The next generation
  generation++;

  // Stopping when it gets to the bottom of the canvas
  if (generation * w > height) {
    noLoop();
  }
}

// Look up a new state from the ruleset.
int rules(int a, int b, int c) {
  String s = "" + a + b + c;
  int index = Integer.parseInt(s, 2);
  return ruleset[7 - index];
}
