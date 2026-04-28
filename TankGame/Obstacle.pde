class Obstacle {
  float x, y, w, h, speed, health;
  PImage obst1;
char idir;

  Obstacle(float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height = 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if(int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random(height);
    } else {
      idir = 's';
      x = random(width);
      y= -100;
    }
    obst1 = loadImage("obj.png");
  }

  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }


  void move() {
    x = x + speed;
    if (x > width) {
      x = 0;
    }
  }
  
  boolean reachedEdge() {
    return x >= width+150 || x<= -150 || y > height + 150 || y < -150;
  } 
}
