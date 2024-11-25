class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;


  // Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(30, 80));
    speed = rockSpeed;
    r1 = loadImage("rock01.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
