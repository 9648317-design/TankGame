// Ellie Mason | Apr 14 2026 | TankGame
PImage bg;
PImage startImage;

Tank tank1;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();

int score;

Timer obsTimer, puTimer;


boolean gameStarted = false;

// Start button
int buttonX = 200;
int buttonY = 450;
int buttonW = 200;
int buttonH = 70;

void setup() {

  size(600, 600);


  bg = loadImage("bg1.png");


  startImage = loadImage("startscreen.png");

  tank1 = new Tank();

  score = 0;

  obsTimer = new Timer(1000);
  obsTimer.start();

  puTimer = new Timer(2000);
  puTimer.start();
}

void draw() {
  if (!gameStarted) {

    background(20);


    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("TANK GAME", width/2, 70);


    imageMode(CENTER);
    image(startImage, width/2, 220, 350, 250);


    fill(0, 200, 100);
    rect(buttonX, buttonY, buttonW, buttonH, 20);


    fill(255);
    textSize(30);
    text("START", width/2, buttonY + 45);
  }

  else {

    background(127);

    imageMode(CORNER);
    image(bg, 0, 0);

    // Add obstacles
    if (obsTimer.isFinished() && obstacles.size() < 5) {

      obstacles.add(
        new Obstacle(
          -100,
          int(random(height)),
          random(2,6),
          int(random(1,5))
        )
      );

      obsTimer.start();
    }

    // Add powerups
    if (puTimer.isFinished()) {

      powerups.add(new PowerUp());
      puTimer.start();
    }

    // Powerups
    for (int i = 0; i < powerups.size(); i++) {

      PowerUp pu = powerups.get(i);

      pu.display();
      pu.move();

      if (pu.reachedEdge()) {
        powerups.remove(pu);
      }

      if (pu.intersect(tank1)) {

        if (pu.type == 'h') {
          tank1.health += 100;
          powerups.remove(pu);

        } else if (pu.type == 'a') {
          tank1.laserCount += 100;
          powerups.remove(pu);

        } else if (pu.type == 't') {
          tank1.turretCount += 1;
          powerups.remove(pu);
        }
      }
    }

    for (int i = 0; i < obstacles.size(); i++) {

      Obstacle obs = obstacles.get(i);

      obs.display();
      obs.move();

      if (obs.reachedEdge()) {
        obstacles.remove(i);
      }
    }

    for (int j = 0; j < projectiles.size(); j++) {

      Projectile p = projectiles.get(j);

      p.move();
      p.display();

      if (p.reachedEdge()) {
        projectiles.remove(j);
        j--;
      }
    }

    tank1.display();

    scorePanel();

    println("Objects in Memory:" + obstacles.size());
    println("Projectiles in Memory:" + projectiles.size());
  }
}

void scorePanel() {

  fill(127, 127);

  rectMode(CENTER);
  rect(width/2, 30, width, 40);

  fill(255);

  textSize(30);
  textAlign(CENTER);

  text("Score:" + score, width/2, 35);
  text("Health:" + tank1.health, width/2-150, 25);
  text("Ammo:" + tank1.laserCount, width/2+150, 25);
}

void keyPressed() {

  if (gameStarted) {

    if (key == 'w') {
      tank1.move('w');

    } else if (key == 's') {
      tank1.move('s');

    } else if (key == 'd') {
      tank1.move('d');

    } else if (key == 'a') {
      tank1.move('a');
    }
  }
}

void mousePressed() {
  if (!gameStarted) {

    if (mouseX > buttonX &&
        mouseX < buttonX + buttonW &&
        mouseY > buttonY &&
        mouseY < buttonY + buttonH) {

      gameStarted = true;
    }
  }

  else {

    projectiles.add(
      new Projectile(
        tank1.x,
        tank1.y,
        tank1.idir
      )
    );
  }
}
