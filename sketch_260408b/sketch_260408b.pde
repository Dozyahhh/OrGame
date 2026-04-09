ControlPanel panel;
Rocket rocket;
Meteor meteor;
Alien alien;
ArrayList<Bullet> bullets;
int border = 140;
int stars = 100;

float[] starX = new float[stars];
float[] starY = new float[stars];
float movespeed = 10;

int distance = 0;
int goal = 25000;
int normalspeed = 5;
int nitrospeed = 50;
int nitrofuel = 30;
int maxnitro = 30;
int ammo = 6;
int maxammo = 6;
boolean shipdamaged = false;
boolean gunsbrake = false;
boolean nitro = false;
boolean win = false;
boolean gameover = false;

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
    
    if (!win && !gameover) {
        if (nitro && nitrofuel > 0) {
          distance += nitrospeed;
          nitrofuel--;
        } else {
          distance += normalspeed;
          nitro = false;
      }
      
    textAlign(LEFT);
    fill(255);
    textSize(16);
   
    text(distance + " / 25000km" , 25, 30);
    text("Nitro" + nitrofuel, 25, 50);
    
    if (distance >= goal) {
      win = true;
      if (win) {
        fill (255);
        textSize(30);
        textAlign(CENTER);
        text("MISSION COMPLETE", (border + width) / 2, height / 2);
        distance = 25000;
      }
      if (gameover) {
        textAlign (LEFT);
        fill(255, 0, 0);
        textSize(10);
        text("SHIP DESTROYED", 10, 140);
        textSize(15);
        text("CLICK TO RESTART", 10, 160);
      }
    }
    } 
    }
  void mousePressed() {
    boolean moverightbutton = dist(mouseX, mouseY, 100, 280) < 10;
    boolean moveleftbutton = dist(mouseX, mouseY, 100, 250) < 10;
    boolean nitrobutton = dist(mouseX, mouseY, 70, 250) < 10;
    
    if (moveleftbutton) {
      rocket.pos.x -= movespeed;
  }
  if (moverightbutton) {
    rocket.pos.x += movespeed;
  }
  if (nitrobutton && nitrofuel > 0) {
    nitro = true; }
  rocket.pos.x = constrain(rocket.pos.x, border + 40, width -40);
  }
  void mouseReleased() {
    nitro = false;
  }
    
