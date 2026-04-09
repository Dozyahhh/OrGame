class Alien {
  PVector pos;
  ArrayList<PVector> bullets;
  int timer;
  
  Alien() {
    pos = new PVector(random(border + 40, width - 40), - 40);
    bullets = new ArrayList<PVector>();
    timer = millis();
  }
  
  void resetPos() {
    pos.y = -40;
    pos.x = random(border + 40, width - 40);
  }
  
  void update() {
    pos.y = pos.y + 1.5;
    if (pos.y > height + 60) {
      resetPos();
    }
  }
  
  void display() {
    fill(255);
    triangle(pos.x - 40, pos.y - 20, pos.x + 40, pos.y - 20, pos.x, pos.y + 30);
    fill(0);
    triangle(pos.x - 12, pos.y - 20, pos.x + 12, pos.y - 20, pos.x, pos.y - 2);
    fill(255);
    rect(pos.x - 6, pos.y + 18, 12, 25);
  }
}
  
  
    
