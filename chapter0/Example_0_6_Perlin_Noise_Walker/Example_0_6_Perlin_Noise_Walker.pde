// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker walker;

void setup() {
  size(640, 360); // creating canvas of size 640 x 360
  walker = new Walker(); // creating an instance/object of class Walker
  background(255);
}

void draw() {
  walker.step();
  walker.show();
}

class Walker {
  float tx,ty,x,y;
  
  Walker() {
    this.tx = 0;
    this.ty = 10000;
  }

  void step() {
    //{!2} x- and y-position mapped from noise
    this.x = map(noise(this.tx), 0, 1, 0, width);
    this.y = map(noise(this.ty), 0, 1, 0, height);

    //{!2} Move forward through "time."
    this.tx += 0.01;
    this.ty += 0.01;
  }

  void show() {
    strokeWeight(2);
    fill(127);
    stroke(0);
    circle(this.x, this.y, 48);
  }
}
