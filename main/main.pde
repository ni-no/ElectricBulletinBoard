Control control;

void setup() {
  size(1000, 400);
  background(255);
  smooth();
  // Initialize geomerative
  RG.init(this);
  control = new Control();
}

void draw() {
  control.display();
  // saveFrame("frames/#####.tif");
}
