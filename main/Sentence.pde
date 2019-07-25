class Sentence {
  //Depends on geomerative
  
  CharFrame []charframes;
  RPoint head;
  RPoint tail;

  Sentence(String _sentence) {
    charframes =  new CharFrame[_sentence.length()];
    int []codes = convert_code(_sentence);
    for (int i=0; i<_sentence.length(); i++) {
      String ch = _sentence.substring(i, i+1);
      charframes[i] = new CharFrame(ch, codes[i]);
    }
    head =  new RPoint(2*Config.fontSize* Config.sizeRate, 2*Config.fontSize* Config.sizeRate);
    tail = new RPoint(Config.fontSize*_sentence.length()* Config.sizeRate, -2*Config.fontSize* Config.sizeRate);
    for (CharFrame _cf : charframes) {
      if (_cf.min.x < head.x) head.x = _cf.min.x;
      if (_cf.min.y < head.y) head.y = _cf.min.y;
      if (_cf.max.y > tail.y) tail.y = _cf.max.y;
    }
    tail.x += head.x;
    
    /*
    print("head: ("+head.x+", "+head.y+")");
    print("tail: ("+tail.x+", "+tail.y+")");
    println();
    */
  }

  void display_chara(int _x, int _y) {
    int dx = 0;
    for (CharFrame _cf : charframes) {
      _cf.display_points(dx + _x, _y);
      dx += Config.fontSize * Config.sizeRate;
    }
  }

  void display_area(int _x, int _y) {
    int dx = 0;
    stroke(0, 0, 255);
    noFill();
    rect(head.x + _x, head.y + _y, get_width(), get_height() );
    for (CharFrame _cf : charframes) {
      _cf.display_area(dx + _x, _y);
      dx += Config.fontSize * Config.sizeRate;
    }
    fill(0);
    stroke(0);
  }

  void display_chara_and_area(int _x, int _y) {
    display_chara(_x, _y);
    display_area(_x, _y);
  }

  float measure_distance(Point _pt, float _dist) {
    Point adjusted = new Point(_pt.x + head.x, _pt.y + head.y);
    int _index = where_belong(adjusted);
    if (_index == -1) return 0;
    return charframes[_index].measure_distance(adjust_diff(_index, adjusted), _dist);
  }

  int where_belong(Point _pt) {
    for (int i=0; i<charframes.length; i++) {
      if (is_in_the_area(adjust_diff(i, _pt),charframes[i].min, charframes[i].max)) return i;
    }
    return -1;
  }
  
  Point adjust_diff(int _index, Point _pt){
    return increment_diff(_pt, -_index*Config.fontSize * Config.sizeRate, 0, 0);
  }

  int get_width() {
    return int(abs(tail.x - head.x));
  }

  int get_height() {
    return int(abs(tail.y - head.y));
  }

  int []convert_code(String _sentence) {
    String []keywords = get_keywords(_sentence);
    int []codes = new int[_sentence.length()];
    for (int i=0; i<codes.length; i++) codes[i] = 3;
    for (int i=0; i<keywords.length; i++) {
      if(i>=3) break;
      int start = _sentence.indexOf(keywords[i]);
      for (int j=start; j<start+keywords[i].length(); j++) codes[j] = i+1;
    }
    return codes;
  }

  String []get_keywords(String _sentence) {
    String url = Config.apiUrl + "?appid=" + Config.apiId + "&sentence=" + URLEncode(_sentence);
    XML []results = loadXML(url).getChildren("Result");
    String []keywords = new String[0];
    for (XML _xml : results) keywords = append(keywords, _xml.getChild("Keyphrase").getContent());
    return keywords;
  }
}
