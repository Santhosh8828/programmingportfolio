// Santhosh Ramanathan | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laser, explosion;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate, strength, rocksPassed, rockSpeed;
boolean play;
Timer rTime, puTime;

void setup() {
  size(800, 800);
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  rTime = new Timer(rockRate);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  laser = new SoundFile(this, "laser.wav");
  explosion = new SoundFile(this, "explosion.wav");
  strength += 15;
  rockSpeed = int(random(1, 5));
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(20);
    if (frameCount % 1000 == 0) {
      level++;
      rTime.totalTime-=150;
      rockSpeed = int(random(3, 7));
    }
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }


    // render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i <powups. size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type == 'h') {
        // 1. remove powerup
        powups.remove(pu);
        // 2. health bennefit
        s1.health += 100;
      } else if (pu.intersect(s1) && pu.type == 't') {
        s1.turretCount++;
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type == 'a') {
        s1.laserCount=100;
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type == 'p') {
        strength += 5;
        powups.remove(pu);
      }
      //3. laser strength
      // 4. ammo increase
      //5. turret count
      //6. heat seeking ammo
      //7. time credit
      //8. remove all enemy objects on screen
      //9. temp score multiplier
      //10. alter speed of enemy objects
      //11. rotating rock for mele damage
      //12. temp invincability


      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }


    //Render lasers and detect rock collide
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser. intersect(rock)) {
          rock.diam -= strength;
          if (rock.diam <1) {
            rocks.remove(rock);
          }
          score += 100;
          lasers.remove(laser);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    // rock distribution
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    // rocks rendered
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);

      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        explosion.stop();
        explosion.play();

        // deduct 10 points
        score -= 10;
        // deduct 10 health;
        s1.health -= 10;
        // delete rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
        rocksPassed++;
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    // chnage code to detect when x number of rocks pass
    if (s1.health<1 || rocksPassed>19) {
      gameOver();
      noLoop();
    }
  }
}
//void keyPressed() {
//  if (key == ' ') {
//    lasers.add(new Laser(s1.x, s1.y));
//  }
//}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(25);
  textAlign(LEFT);
  text("Score:" + score, 20, 36);
  text("Health:" + s1.health, 180, 36);
  text("level:" + level, 340, 36);
  text("Ammo:" + s1.laserCount, 440, 36);
  text("Rocks Passed: " + rocksPassed, 580, 36);
}

void startScreen() {
  background(0);
  fill(255);
  PFont font;
  font = createFont("SpongeTitle.ttf", 35);
  textFont(font);

  textAlign(CENTER);
  text("Welcome to Spacegame!", width/2, 50);
  text("This game was created by:\n Santhosh Ramanathan!", width/2, 100);
  text("Help Mr plankton escape from space\n by shooting rocks and surviving to the end \n  make sure to use power ups to your \n advantage", width/2, 250);
  text("Please click to start!", width/2, 500);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over", width/2, 300);
  text("Score:" + score, width/2, 350 );
  text("Level:" + level, width/2, 400);
}

void ticker() {
  background(0);
  fill(255);
  text("Game Over", width/2, 300);
  text("Score:" + score, width/2, 320 );
  text("Level:" + level, width/2, 340);
}

void mousePressed() {
  if (!laser.isPlaying()) {
    laser.play();
  }
  if ( s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount --;
  } else  if ( s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount -=2;
  } else if (s1.fire() && s1.turretCount == 3) {

    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
     lasers.add(new Laser(s1.x+0, s1.y));
    s1.laserCount -=3;
  }
}
