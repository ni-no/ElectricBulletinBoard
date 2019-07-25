class BulletinBoard {
  Sentence sentence;
  BoardAnimation board;
  Board topFrame;
  Board buttomFrame;
  
  BulletinBoard(String _sentence, int _fq, boolean _rp) {
    if (_rp) _sentence += "　　　";
    sentence = new Sentence(_sentence);
    board = new BoardAnimation(sentence.get_width(), sentence.get_height(), Config.radius, _fq, _rp);
    topFrame = new Board(sentence.get_width(), Config.bulletinmargin, Config.radius);
    buttomFrame = new Board(sentence.get_width(), Config.bulletinmargin, Config.radius);
    convert_figure();
    //board.print_point_z();
    println("Set up BulletinBoard completely");
  }

  void convert_figure() {
    for (int c=0; c<board.points.length; c++) {
      for (int r=0; r<board.points[0].length; r++) {
        board.points[c][r].z = sentence.measure_distance(board.points[c][r], 3*board.radius);
      }
    }
  }

  void display() {
    pushMatrix();
    topFrame.display();
    translate(0, Config.radius*2*Config.bulletinmargin);
    board.display();
    translate(0, Config.radius*2*board.get_num_of_rows());
    buttomFrame.display();
    popMatrix();
  }

  void move() {
    board.move_horizonal();
  }
}
