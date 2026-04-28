class PowerUp {
  int x, y, w, h, speed;
  char type;
  
  //PImage obst1;
 //char idir;

  PowerUp(int x , int y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
   speed = 2;
   if(random(3) == 1) {
     type = 'h';
   } else if (random(2) == 1) {
     type = 't';
   } else {
     type = 'a';
 
  }
  }

  void display() {
    if(type == 'a') {
      fill(200,0,0);
      ellipse(x,y,w,h);
      fill (255);
      text("ammo",x,y);
    } else if(type == 'a') {
      fill(0,200,0);
      ellipse(x,y,w,h);
    } else if(type == 'a') {
      fill(0,0,200);
      ellipse(x,y,w,h);
    }
  }


  void move() {
     y = y + speed;
  }
}
