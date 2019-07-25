class Board {
  Point [][]points; 
  float radius;

  Board(int _col, int _row, float _r) {
    radius = _r;
    points = new Point[_col][_row];
    for (int c=0; c<_col; c++) {
      for (int r=0; r<_row; r++) {
        points[c][r] = new Point(int(2*_r*(c+0.5)), int(2*_r*(r+0.5)), 0);
      }
    }
    /* print_point_z();
    println("Col", get_num_of_collumns());
    println("Row", get_num_of_rows());
    */
  }

  void display() {
    fill(0);
    noStroke();
    rect(points[0][0].x, points[0][0].y, get_width(), get_height());
    for (Point[] _points : points) {
      for (Point _point : _points) {
        fill(identify_code(_point.z));
        noStroke();
        ellipse(_point.x, _point.y, radius*2, radius*2);
      }
    }
  }

  void move_horizonal(int _dx, boolean _rp) {
    Point [][]temp = new Point[_dx][get_num_of_rows()];
    if (_rp) {
      for (int c=0; c<_dx; c++) {
        for (int r=0; r<get_num_of_rows(); r++) {
          temp[c][r] = points[c][r];
        }
      }
    }
    for (int c=0; c<get_num_of_collumns() - _dx; c++) {
      for (int r=0; r<get_num_of_rows(); r++) {
        points[c][r].z = points[c + _dx][r].z;
      }
    }
    if (_rp) {
      for (int c=get_num_of_collumns()-_dx; c<get_num_of_collumns(); c++) {
        for (int r=0; r<get_num_of_rows(); r++) {
          points[c][r].z = temp[c-(get_num_of_collumns()-_dx)][r].z;
        }
      }
    } else {
      for (int c=get_num_of_collumns()-_dx; c<get_num_of_collumns(); c++) {
        for (int r=0; r<get_num_of_rows(); r++) {
          points[c][r].z = 0;
        }
      }
    }
  }

  void print_point_z() {
    print(" ", "||");
    for (int c=0; c<get_num_of_collumns(); c++) {
      print(c, "|");
    }
    println();
    for (int r=0; r<get_num_of_rows(); r++) {
      print(r, "||");
      for (int c=0; c<get_num_of_collumns(); c++) {
        print(points[c][r].z, "|");
      }
      println();
    }
  }

  color identify_code(float _num) {
    switch(int(_num)) {
    case 1:
      return color(#ff3255); //red
    case 2:
      return color(#ff8a2e); //orange
    case 3:
      return color(#9fc447); //green
    }
    return color(#656054);
  }
  
  int get_width(){
   return int(points[get_num_of_collumns()-1][get_num_of_rows()-1].x - points[0][0].x + 2*radius);
  }
  
  int get_height(){
   return int(points[get_num_of_collumns()-1][get_num_of_rows()-1].y - points[0][0].y + 2*radius);
  }

  int get_num_of_collumns() {
    return points.length;
  }

  int get_num_of_rows() {
    return points[0].length;
  }
}
