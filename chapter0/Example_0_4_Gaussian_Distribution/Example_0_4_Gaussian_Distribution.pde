// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  //{!1} A normal distribution with mean 320 and standard deviation 60
  float x = (randomGaussian() * 60) + 320;
  noStroke();
  fill(0, 10);
  circle(x, 180, 16);
}
