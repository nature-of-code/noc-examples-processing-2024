// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An array to keep track of how often random numbers are picked
int[] randomCounts = new int[20];

void setup() {
  size(640, 360);
  for (int i = 0; i < 20; i++) {
    randomCounts[i] = 0;
  }
}

void draw() {
  background(255);

  // Pick a random number and increase the count
  int index = int(acceptreject() * randomCounts.length);
  randomCounts[index]++;

  // Draw a rectangle to graph results
  stroke(0);
  strokeWeight(2);
  fill(127);

  float w = width / randomCounts.length;

  for (int x = 0; x < randomCounts.length; x++) {
    rect(x * w, height - randomCounts[x], w - 1, randomCounts[x]);
  }
}

// An algorithm for picking a random number based on monte carlo method
// Here probability is determined by formula y = x
float acceptreject() {
  // We do this "forever" until we find a qualifying random value.
  while (true) {
    // Pick a random value.
    float r1 = random(1);
    // Assign a probability.
    float probability = r1;
    // Pick a second random value.
    float r2 = random(1);

    //{!3} Does it qualify?  If so, we're done!
    if (r2 < probability) {
      return r1;
    }
  }
}
