// Ellie Mason | Apr 14 2026 | TankGame
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;
Timer obsTimer;

void setup() {
  size(600, 600);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(55, 500));
  //obstacles.add(new Obstacle(25, 400));
  //obstacles.add(new Obstacle(40, 300));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
}
void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // add timer to distribute obstacles
  if(obsTimer.isFinished() && obstacles.size() < 5) {
  obstacles.add(new Obstacle(-100, int(random(height)),random(2,6), int(random(1, 5))));
  obsTimer.start();
}
  // displaying obstacles
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
    j--; // important to avoid skipping items
  }
}
   
   tank1.display();
   scorePanel();
   println("Objects in Memory:"+obstacles.size());
   println("Projectiles in Memory:"+projectiles.size());
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
  projectiles.add(new Projectile(tank1.x, tank1.y, tank1.idir));
}
