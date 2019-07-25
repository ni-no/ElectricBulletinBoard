import java.io.UnsupportedEncodingException;

String URLEncode(String string) {
  String output = new String();
  try {
    byte[] input = string.getBytes("UTF-8");
    for (int i=0; i<input.length; i++) {
      if (input[i]<0) { 
        output += '%' + hex(input[i]);
      } else if (input[i]==32) { 
        output += '+';
      } else { 
        output += char(input[i]);
      }
    }
  } 
  catch(UnsupportedEncodingException e) {
    e.printStackTrace();
  }
  return output;
}
