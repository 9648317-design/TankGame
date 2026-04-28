class Tank {
  int x, y, w, h, speed, health, dx, dy;
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
    iTankA = loadImage("tank1.png");
    iTankS = loadImage("tank3.png");
    iTankD = loadImage("tank2.png");
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
    idir = dir;
   if (dir == 'd') {        
    x += speed;
    w += speed;
  } 
  else if (dir == 'a') {  
    x -= speed;
  } 
  else if (dir == 'w') {  
    y -= speed;
  } 
  else if (dir == 's') {   
    y += speed;
  }
  }
  
  boolean intersect (Obstacle o) {
    
    float distance = dist(x,y,o.x, o.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  
}
