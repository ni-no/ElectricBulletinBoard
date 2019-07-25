class CharFrame {
  String chara;
  Point max, min;
  Point[] points;

  CharFrame(String _chara, float _num) {
    chara = _chara;
    RShape grp = RG.getText(_chara, Config.font, Config.fontSize, CENTER);
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(Config.polygonizerLen);
    points = convert_from_RPoint(grp.getPoints(), _num);
    if (points == null) {
      min = new Point(-Config.fontSize*Config.spaceRate/2, -Config.fontSize*Config.spaceRate);
      max = new Point(Config.fontSize*Config.spaceRate/2, 0);
    } else {
      calculate_area();
    }
  }

  CharFrame(String _chara, float _num, float _dx, float _dy) {
    chara = _chara;
    RShape grp = RG.getText(_chara, Config.font, Config.fontSize, CENTER);
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(Config.polygonizerLen);
    points = convert_from_RPoint(grp.getPoints(), _num);
    if (points == null) {

      min = new Point(-Config.fontSize*Config.spaceRate/2 + _dx, -Config.fontSize*Config.spaceRate + _dy);
      max = new Point(Config.fontSize*Config.spaceRate/2 + _dx, 0 + _dy);
    } else {
      for (Point _pt : points) _pt = increment_diff(_pt, _dx, _dy, 0);
      calculate_area();
    }
  }

  void calculate_area() {
    max = new Point(-2*Config.fontSize, -2*Config.fontSize);
    min = new Point(2*Config.fontSize, 2*Config.fontSize);
    for (Point _pt : points) {
      if (_pt.x < min.x) min.x = _pt.x;
      if (_pt.y < min.y) min.y = _pt.y;
      if (_pt.x > max.x) max.x = _pt.x;
      if (_pt.y > max.y) max.y = _pt.y;
    }
  }

  void display_points(int _dx, int _dy) {
    if (points != null) {
      for (Point _pt : points) {
        stroke(identify_code(_pt.z));
        point(_pt.x + _dx, _pt.y + _dy);
      }
    }
  }

  void display_area(int _dx, int _dy) {
    stroke(0, 0, 255);
    noFill();
    rect(min.x + _dx, min.y + _dy, get_width(), get_height());
    fill(0);
    stroke(0);
  }

  color identify_code(float _num) {
    switch(int(_num)) {
    case 1:
      return color(255, 0, 0); //red
    case 2:
      return color(255, 165, 0); //orange
    case 3:
      return color(152, 251, 152); //green
    }
    return color(143, 188, 143);
  }

  float measure_distance(Point _targets, float _dist) {
    if (points != null) {
      for (Point _pt : points) if (is_shorter(_pt, _targets, _dist)) return _pt.z;
    }
    return 0;
  }

  int get_width() {
    return int(abs(max.x - min.x));
  }

  int get_height() {
    return int(abs(max.y - min.y));
  }
}
