ControlPanel panel;
Rocket rocket;
ArrayList<Bullet> bullets;
void setup() {
  size(400, 400);
  panel = new ControlPanel();
  rocket = new Rocket(270, 270);
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(270, 200));
}
  void draw() {
    background(255);
    panel.display();
    rocket.display();
    for(int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.display();
    }
  }
  
    
