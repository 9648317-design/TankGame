// Ellie Mason | Apr 14 2026 | TankGame
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;

void setup() {
  size(600, 600);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  obstacles.add(new Obstacle(55, 500));
  obstacles.add(new Obstacle(25, 400));
  obstacles.add(new Obstacle(40, 300));
  score = 0;
}
void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // displaying objects
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
  
  }
   for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
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
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
  } else if (key =='s') {
    tank1.move ('s');
  } else if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('a');
  }
}

void mousePressed() {
  projectiles.add(new Projectile(tank1.x, tank1.y));
}
