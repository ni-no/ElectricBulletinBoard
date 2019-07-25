class TextField {
  //Depends on swing, awt
  
  JLayeredPane panel;
  JTextField field;
  Button button;

  TextField(int _x, int _y, int _w, int _h) {
    Canvas canvas = (Canvas) surface.getNative();
    panel = (JLayeredPane) canvas.getParent().getParent();
    field = new JTextField();
    field.setBounds(_x, _y, _w, _h);
    panel.add(field);
    button = new Button(_x + _w + 10, _y, _w/5, _h, "ENTER");
  }
  
  void display(){
    button.display();
  }
  
  boolean mouse_press(){
   return button.mouse_press(); 
  }
  
  String get_text(){
    return field.getText();
  }
  
  void key_press(){
   if(keyCode == ENTER) field.setText(""); 
  }
}
