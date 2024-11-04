// Santhosh Ramanathan | TempConverter | 23 September 2024

void setup() {
  size(400, 200);
}

void draw () {
  background(128);
  textAlign(CENTER);
  textSize(25);
  text (" Temperature converter \n by Santhosh R", width/2 , 40);
  
  //Display your name and app title 
  line(0, 150, width, 150);
  for (int i=0; i<width +1; i=i+50) {
    line(i-200, 145, i-200, 155);
    textAlign(CENTER);
    textSize(10);
    text(i, i, 165);
  }
  text("Far: " + celToFar(mouseX),width/2,120);
  text("Cel: " +farToCel(mouseX), width/2, 100);
  
  //TODO; add far info
  //TODO; change the number line to display -200 to 200
  println("MouseX:" + mouseX + " : " + farToCel(mouseX));
}

float farToCel(float tempFar) {
  // formula to calc cel
  tempFar = (tempFar -32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  //include
  tempCel = tempCel *(9.0/5.0) + (32.0);
  return tempCel;
}
  
