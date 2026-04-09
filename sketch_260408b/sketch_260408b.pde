ControlPanel panel;
Rocket rocket;
Meteor meteor;
Alien alien;
ArrayList<Bullet> bullets;
int border = 140;
int stars = 100;
float[] starX = new float[stars];
float[] starY = new float[stars];

void setup() {
  size(400, 400);
  panel = new ControlPanel();
  rocket = new Rocket(270, 270);
  meteor = new Meteor();
  alien = new Alien();
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(270, 200));
  
  for (int i = 0; i < stars; i ++) {
    starX[i] = random(width);
    starY[i] = random(height);
}
}
  void draw() {
    background(0);
    panel.display();
     meteor.display();
     meteor.update();
    rocket.display();
    alien.display();
    alien.update();
    stroke(255);
    for (int i = 0; i < stars; i++) {
      point(starX[i], starY[i]);
      starY[i] += 1;
      if (starY[i] > height) {
        starY[i] = 0;
        starX[i] = random(width);
  }
    }
    for(int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.display();
    }
    }
  
    
