// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker walker;

void setup() {
  size(640, 360);
  // Creating the Walker object!
  walker = new Walker();
  background(255);
}

void draw() {
  walker.step();
  walker.show();
}

class Walker {
  float x,y;
  
  Walker() {
    this.x = width / 2;
    this.y = height / 2;
  }

  void show() {
    stroke(0);
    point(this.x, this.y);
  }

  void step() {
    float r = random(1);
    // A 40% of moving to the right!
    if (r < 0.4) {
      this.x++;
    } else if (r < 0.6) {
      this.x--;
    } else if (r < 0.8) {
      this.y++;
    } else {
      this.y--;
    }
    this.x = constrain(this.x, 0, width - 1);
    this.y = constrain(this.y, 0, height - 1);
  }
}
