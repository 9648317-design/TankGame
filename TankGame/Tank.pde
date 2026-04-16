class Tank {
  int x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;

  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 2;
    health = 100;
    iTankW = loadImage("tank.png");
    iTankA = loadImage("tank.png");
    iTankS = loadImage("tank.png");
    iTankD = loadImage("tank.png");
    idir = 'w';

  }

  void display() {

    imageMode(CENTER);
    if(idir == 'w') {
       image (iTankW,x,y);
    } else if (idir == 'a') {
      image(iTankA,x,y);
    } else if (idir == 's') {
      image(iTankS,x,y); 
    } else if (idir =='d') {
      image (iTankD, x, y);
    }
    
    
  }


  void move(char dir) {
   if (dir == 'd') {        // right
    x += speed;
    w += speed;
  } 
  else if (dir == 'a') {   // left
    x -= speed;
    w -= speed;
  } 
  else if (dir == 'w') {   // up
    y -= speed;
  } 
  else if (dir == 's') {   // down
    y += speed;
  }
  }
}
