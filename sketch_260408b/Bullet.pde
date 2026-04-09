class Bullet {
  PVector pos;
  PVector vel;
  Bullet (float startX, float startY) {
    pos = new PVector(startX, startY) ;
    vel = new PVector(0, -6);
  }
  void update() {
    pos.add(vel);
  }
  void display() {
    fill(255, 150, 0);
    rect(pos.x, pos.y, 10, 20);
  }
}
