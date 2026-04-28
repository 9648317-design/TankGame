class Projectile {
  int x, y, w, h, speed,dx,dy;
  char dir;

  
  
  Projectile(int x, int y, char dir) {
    this.x = x;
    this.y = y;
   this.dir = dir;
    w = 10;
    h = 10;
    speed = 2;
  }

  void display() {
    rectMode(CENTER);
    rect(x,y,w,h);
    w = 10;
    h = 10;

  }

 void move() {
    if (dir == 'w') y -= speed;
    if (dir == 's') y += speed;
    if (dir == 'a') x -= speed;
    if (dir == 'd') x += speed;
  }


boolean reachedEdge() {
  return (x < 0 || x > width || y < 0 || y > height);
}

  }
