
class Button {
  // Member variables
  int x, y, w, h;
  color c1, c2;
  String val;
  String shape;
  boolean on, isNum;


  //Constructors
  Button(int x, int y, String val, color c1, String shape, boolean isNum) {
    this.x = x;
    this.y = y;
    w = 20;
    h = 20;
    this.c1= c1;
    c2 = color(150);
    this.val = val ;
    this. shape = shape;
    on=false;
    this.isNum = isNum;
  }

  //Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    if (shape.equals("CIRCLE")) {
      ellipse(x, y, w, h);
    } else {
      if(val=="0"){
      rect(x, y,50,20, 5);
      
      }else{
        rect(x, y, w, h, 5);
      }
    }
    fill(0);
    textAlign(CENTER, CENTER);
    
    text(val, x, y);
  }


  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
