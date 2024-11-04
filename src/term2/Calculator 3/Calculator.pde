//Santhosh Ramanathan | Calc Project | 2 Oct 2024
Button[] buttons = new Button[22];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(180, 210);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(45, 150, "0", color(255, 220, 2), "RECTANGLE", true);
  buttons[1] = new Button(30, 120, "1", color(255, 220, 2), "RECTANGLE", true);
  buttons[2] = new Button(60, 120, "2", color(255, 220, 2), "RECTANGLE", true);
  buttons[3] = new Button(90, 120, "3", color(255, 220, 2), "RECTANGLE", true);
  buttons[4] = new Button(30, 90, "4", color(255, 220, 2), "RECTANGLE", true);
  buttons[5] = new Button(60, 90, "5", color(255, 220, 2), "RECTANGLE", true);
  buttons[6] = new Button(90, 90, "6", color(255, 220, 2), "RECTANGLE", true);
  buttons[7] = new Button(30, 60, "7", color(255, 220, 2), "RECTANGLE", true);
  buttons[8] = new Button(60, 60, "8", color(255, 220, 2), "RECTANGLE", true);
  buttons[9] = new Button(90, 60, "9", color(255, 220, 2), "RECTANGLE", true);
  buttons[10] = new Button(90, 150, ".", color(255, 220, 2), "RECTANGLE", false);
  buttons[11] = new Button(30, 180, "x²", color(8, 177, 252), "RECTANGLE", false);
  buttons[12] = new Button(60, 180, "√", color(8, 177, 252), "RECTANGLE", false);
  buttons[13] = new Button(90, 180, "π", color(8, 177, 252), "RECTANGLE", false);
  buttons[14] = new Button(120, 180, "%", color(8, 177, 252), "RECTANGLE", false);
  buttons[15] = new Button(150, 120, "=", color(247, 137, 11), "RECTANGLE", false);
  buttons[16] = new Button ( 150, 90, "±", color(247, 137, 11), "RECTANGLE", false);
  buttons[17] = new Button ( 150, 60, "Cl", color(247, 137, 11), "RECTANGLE", false);
  buttons[18] = new Button ( 120, 60, "/", color(255, 20, 20), "CIRCLE", false);
  buttons[19] = new Button ( 120, 90, "x", color(255, 20, 20), "CIRCLE", false);
  buttons[20] = new Button ( 120, 120, "+", color(255, 20, 20), "CIRCLE", false);
  buttons[21] = new Button ( 120, 150, "-", color(255, 20, 20), "CIRCLE", false);
}

void draw() {
  background(70);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i]. hover(mouseX, mouseY);
  }



  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(206);
  rect(width/2, 25, 140, 30);
  fill(0);
  if (dVal.length()<12) {
    textSize(21);
  } else if (dVal.length()<13) {
    textSize(20);
  } else if (dVal.length()<14) {
    textSize(18);
  } else if (dVal.length()<15) {
    textSize(17);
  } else if (dVal.length()<16) {
    textSize(16);
  } else if (dVal.length()<17) {
    textSize(15);
  } else if (dVal.length()<18) {
    textSize(14);
  } else if (dVal.length()<19) {
    textSize(13);
  } else if (dVal.length()<20) {
    textSize(12);
  } else if (dVal.length()<21) {
    textSize(12);
  }
  textAlign(RIGHT);
  text(dVal, width -40, 30, 20);
}

void mouseReleased() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && buttons[i].val.equals("Cl")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val.equals("/")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalc();
    } else if ( buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else  if (left == false) {
        l *= -1;
        dVal = str(r);
      }
    } else if ( buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else  if (left) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if ( buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else  if (left) {
        r = PI;
        dVal = str(r);
      }
    } else if ( buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l *= 0.01;
        dVal = str(l);
      } else  if (left) {
        r *= 0.01;
        dVal = str(r);
      }
    } else if ( buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x²")) {
      if (left) {
        l *= l;
        dVal = str(l);
      } else  if (left) {
        r *= r;
        dVal = str(r);
      }
    }
    //  // if (buttons[i].on == true && dVal.equals("0.0")) {
    //  // dVal = buttons[i].val;
    //  // }
    //  // } else if (buttons[i].on) {
    //  // dVal += buttons[i].val;
    //  //}
    //}
    //println("Left:" + l + " RIGHT" + r + " RESULT:" + result + " Op:" + op + " L:" + left);
  }
}
void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  }
  dVal=str(result);
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode == 107 ) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109 ) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106 ) {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 111 ) {
    handleEvent("/", false);
  } else if (key == '=' || keyCode == 61 ) {
    handleEvent("=", false);
  } else if (key == '.' || keyCode == 110 ) {
    handleEvent(".", false);
  }
}



void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length () < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else  if (!left && dVal.length () < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("*") && !isNum) {
    op = '*';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    op = '/';
    left = false;
    dVal = "0";
  } else if (keyVal.equals(".") && !isNum) {
    dVal += ".";
  } else if (left && dVal.length () < 20 && isNum) {
    if (dVal.equals("1")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else  if (!left && dVal.length () < 20 && isNum) {
    if (dVal.equals("1")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  }
}
