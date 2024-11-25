class Spaceship {
  // Member Variables
  int x, y, w, laserCount, turretCount, health;
  PImage ship;

  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 25;
    turretCount = 1;
    health = 100;
    ship = loadImage("ship.png");
  }

  // Member Methods
  void display() {
    //paste
    image(ship, x, y);
    ship.resize(70, 90);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
