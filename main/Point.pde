class Point {
  float x, y, z;
  
  Point(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
  }

  Point(float _x, float _y) {
    x = _x;
    y = _y;
    z = 0;
  }
  
  void print_point(){
    println("("+x+", "+y+", "+z+" )");
  }
}

Point increment_diff(Point _pt, float _dx, float _dy, float _dz){
  return new Point(_pt.x + _dx, _pt.y + _dy, _pt.z + _dz);
}

Point increment_points(Point _pt1, Point _pt2){
  return new Point(_pt1.x + _pt2.x, _pt1.y + _pt2.y, _pt1.z + _pt2.z);
}

Point []convert_from_RPoint(RPoint []_pt, float _num) {
  if (_pt == null) return null;
  Point []retPoints = new Point[_pt.length];
  for (int i=0; i<_pt.length; i++) retPoints[i] = new Point(_pt[i].x, _pt[i].y, _num);
  return retPoints;
}

boolean is_shorter(Point _pt1, Point _pt2, float _r) {
  return (dist( _pt1.x, _pt1.y, _pt2.x, _pt2.y) <= _r/2);
}

boolean is_in_the_area(Point _target, Point _head, Point _tail) {
  return  (is_on_line(_target.x, _head.x, _tail.x) && is_on_line(_target.y, _head.y, _tail.y));
}

boolean is_on_line(float _target, float _head, float _tail) {
  return (_head <= _target && _target <= _tail);
}
