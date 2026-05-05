class PowerUp {
  int x, y, w, h, speed;
  char type;
  
  //PImage obst1;
 //char idir;

  PowerUp() {
    x = int(random(width));
    y = -100;
    w = 100;
    h = 100;
   speed = 2;
   
   int r = int(random(3));
  if (r == 0) {
  type = 'h';
} else if (r == 1) {
  type = 't';
} else {
  type = 'a';
}
  }

  void display() {
    if (type == 'a') {
  fill(200, 0, 0);
  ellipse(x, y, w, h);
  fill(255);
  text("ammo", x, y);
} else if (type == 'h') {
  fill(0, 200, 0);
  ellipse(x, y, w, h);
} else if (type == 't') {
  fill(0, 0, 200);
  ellipse(x, y, w, h);
}
  }


  void move() {
     y = y + speed;
  }
  
  boolean reachedEdge(){
return x >= width+150 || x<= -150 || y >= height+150 || y<= -150;
}

Boolean intersect(Tank t) {
float distance = dist(x, y, t.x, t.y);
if (distance < 100) {
return true;
} else {
return false;
}
}
  
}
