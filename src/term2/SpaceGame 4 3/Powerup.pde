class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage turret, strength, health, ammo;
  // PImage r1;


  // Constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = int(random(50, 90));
    speed = int(random(1, 5));
    //r1 = loadImage("rock01.png");
    
    int rand = int(random(4));
    if (rand == 0) {
      type = 'h';
      health = loadImage("health.png");
    } else if (rand == 1) {
      type = 'a';
      ammo = loadImage("Ammo.png");
    } else if (rand == 2) {
      type = 't';
      turret = loadImage("Turret.png");
    } else if (rand == 3) {
      type = 'p';
      strength = loadImage("Strength.png");
    }
  }

  // Member Methods
  void display() {
    if (type == 'h') {
      imageMode(CENTER);
      health.resize(diam, diam);
      image(health, x, y);
    } else if (type == 'a') {
      imageMode(CENTER);
      ammo.resize(diam, diam);
      image(ammo, x, y);
    } else if (type == 't') {
      imageMode(CENTER);
      turret.resize(diam, diam);
      image(turret, x, y);
    } else if (type == 'p') {
      imageMode(CENTER);
      strength.resize(diam, diam);
      image(strength, x, y);
    }

    //ellipse(x, y, diam, diam);
    //imageMode(CENTER);
    //r1.resize(diam, diam);
    //image(r1, x, y);
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

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
