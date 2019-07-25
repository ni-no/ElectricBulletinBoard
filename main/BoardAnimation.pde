class BoardAnimation extends Board {
  int frame;
  int frequency;
  boolean repeat;

  BoardAnimation(int _col, int _row, float _r, int _fr, int _fq, boolean _rp) {
    super(_col, _row, _r);
    frame = _fr;
    frequency = _fq;
    repeat = _rp;
  }

  BoardAnimation(int _w, int _h, float _r, int _fq, boolean _rp) {
    super(int(_w/(_r*2)), int(_h/(_r*2)), _r);
    frame = Config.frame;
    frequency = _fq;
    repeat = _rp;
  }

  void move_horizonal() {
    if (frameCount % frequency == 0) super.move_horizonal(frame, repeat);
  }
}
