class Button {
  Point start;
  Point size;
  String text;

  Button(int _x, int _y, int _w, int _h, String _text) {
    start = new Point(_x, _y);
    size = new Point(_w, _h);
    text = _text;
  }

  void display() {
    fill(255);
    stroke(0);
    rect(start.x, start.y, size.x, size.y);
    textAlign(CENTER);
    fill(0);
    textSize(Config.textFontSize);
    text(text, start.x+size.x/2, start.y+3*size.y/4);
  }

  boolean mouse_press() {
    return (mousePressed && is_inside(mouseX, mouseY));
  }

  boolean is_inside(int _x, int _y) {
    return is_in_the_area(new Point(_x, _y), start, increment_points(start, size));
  }
}
