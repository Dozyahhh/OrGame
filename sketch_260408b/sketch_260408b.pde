ControlPanel panel;
Rocket rocket;
Meteor meteor;
ArrayList<Bullet> bullets;
int border = 140;
void setup() {
  size(400, 400);
  panel = new ControlPanel();
  rocket = new Rocket(270, 270);
  meteor = new Meteor();
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(270, 200));
}
  void draw() {
    background(255);
    panel.display();
     meteor.display();
     meteor.update();
    rocket.display();
  
    for(int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.display();
    }
  }
  
    
