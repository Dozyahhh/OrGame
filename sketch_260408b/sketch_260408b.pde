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
int hits = 0;
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
    
    float bodyhit = dist(meteor.pos.x, meteor.pos.y, rocket.pos.x, rocket.pos.y);
    if (bodyhit < 55 && !gameover) {
      hits++;
      meteor.reset();
      if (hits ==1) {
        shipdamaged = true;
        normalspeed = 2;
      } else if (hits >= 2) {
          gameover = true;
        }
      }
      float alienhit = dist(alien.pos.x, alien.pos.y, rocket.pos.x, rocket.pos.y);
      if (alienhit < 55 && !gameover) {
        hits++;
        alien.resetPos();
        if (hits == 1) {
          shipdamaged = true;
          normalspeed = 2;
        } else if (hits >=2) {
          gameover = true;
        }
      }
        float leftgunhit = dist(meteor.pos.x, meteor.pos.y, rocket.pos.x - 35, rocket.pos.y - 70);
        float rightgunhit = dist(meteor.pos.x, meteor.pos.y, rocket.pos.x + 35, rocket.pos.y + 70);
        if ((leftgunhit < 25 || rightgunhit < 25) && !gameover) {
          gunsbrake = true;
          meteor.reset();
        }
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
      float bulletmeteorhit = dist(b.pos.x, b.pos.y, meteor.pos.x, meteor.pos.y);
      if (bulletmeteorhit < 25) {
      meteor.reset();
      bullets.remove(i);
      continue;
    }
    float bulletAlienHit = dist(b.pos.x, b.pos.y, alien.pos.x, alien.pos.y);
    if (bulletAlienHit < 30) {
      alien.resetPos();
      bullets.remove(i);
      continue;
    }
    if (b.pos.y < 0) {
      bullets.remove(i);
    }
    }
    if (!win && !gameover) {
        if (nitro && nitrofuel > 0) {
          distance += nitrospeed;
          nitrofuel--;
        } else {
          distance += normalspeed;
          nitro = false;
      }
      }
      
    textAlign(LEFT);
    fill(255);
    textSize(16);
   
    text(distance + " / 25000km" , 25, 30);
    text("Nitro" + nitrofuel, 25, 50);
    
    if (distance >= goal) {
      win = true;

    }
    } 
  void mousePressed() {
    if (gameover) {
      resetgame();
      return;
    }
    
    boolean moverightbutton = dist(mouseX, mouseY, 100, 280) < 10;
    boolean moveleftbutton = dist(mouseX, mouseY, 100, 250) < 10;
    boolean nitrobutton = dist(mouseX, mouseY, 70, 250) < 10;
    boolean shootbutton = dist(mouseX, mouseY, 70, 280) < 10;
    boolean reloadbutton = dist(mouseX, mouseY, 30, 370) <10;
    boolean repairbutton = dist(mouseX, mouseY, 80, 370) <10;
    
    if (shootbutton && ammo > 0 && !gameover &&!gunsbrake) {
      bullets.add(new Bullet(rocket.pos.x - 35, rocket.pos.y - 70));
      bullets.add(new Bullet(rocket.pos.x + 35, rocket.pos.y - 70));
      ammo--;
    }
    if (reloadbutton) {
      ammo = maxammo;
    }
    
    if (moveleftbutton) {
      rocket.pos.x -= movespeed;
  }
  if (moverightbutton ) {
    rocket.pos.x += movespeed;
  }
  if (nitrobutton && nitrofuel > 0) {
    nitro = true; }
    
    if (repairbutton) {
      gunsbrake = false;
    }
  rocket.pos.x = constrain(rocket.pos.x, border + 40, width -40);
  
  }

  void mouseReleased() {
    nitro = false;
  }
  
  void resetgame() {
    distance = 0;
    win = false;
    gameover = false;
    nitro = false;
    nitrofuel = maxnitro;
    ammo = maxammo;
    normalspeed = 5;
    shipdamaged = false;
    hits = 0;
    rocket.pos.x = 270;
    rocket.pos.y = 270;
    bullets.clear();
    meteor.reset();
    alien = new Alien();
  }
    
