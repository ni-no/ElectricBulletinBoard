import geomerative.*;
import javax.swing.*;
import java.awt.*;

class Control {
  BulletinBoard bb;
  TextField tf;

  Control() {
    bb = new BulletinBoard(Config.defaultword, 1, true);
    tf = new TextField(width/4, height/2, width/2, 20);
  }
  
  void display(){
   bb.display();
   bb.move();
   tf.display();
   if (tf.mouse_press()) change();
  }
  
  void change(){
    bb = new BulletinBoard(tf.get_text(), 1, true);
    background(255);
  }
}
