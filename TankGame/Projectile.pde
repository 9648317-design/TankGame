class Projectile {
  int x, y, w, h, speed;

  
  
  Projectile(int x, int y) {
    this.x = x;
    this.y = y;
    w = 10;
    h = 10;
    speed = 2;
  }

  void display() {
    rectMode(CENTER);
    rect(x,y,width,height);
  }


  void move(int x, int y) {
    y=y - speed;
  }
}
