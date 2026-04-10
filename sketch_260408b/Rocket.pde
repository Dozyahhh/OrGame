class Rocket {
  PVector pos;
  PVector accel;
  PVector rotation;
  Rocket(float X, float Y) {
    pos = new PVector(X, Y);
}
void display() {
  rectMode(CENTER);
   stroke(3);
   
  if (hits >= 2) {
    fill (255, 0, 0); 
  } else if (shipdamaged) {
      fill (255, 220, 0);
    } else {
      fill(200);
    }
    rect(pos.x, pos.y, 40, 150);
  triangle(pos.x - 20, pos.y - 75, pos.x, pos.y - 110, pos.x + 20, pos.y - 75);
  
  fill(255);
  triangle(pos.x - 35, pos.y + 100, pos.x, pos.y + 50, pos.x + 35, pos.y + 100);
  
  fill(170);
  ellipse(pos.x, pos.y - 10, 25, 25);
  
  fill(120);
  rect(pos.x - 35, pos.y + 20, 25, 80);
  rect(pos.x + 35, pos.y + 20, 25, 80);
  
  fill(160);
  rect(pos.x - 35, pos.y - 40, 6, 60);
  rect(pos.x + 35, pos.y - 40, 6, 60);
  
  fill(60);
  rect(pos.x - 35, pos.y - 70, 16, 28);
  rect(pos.x + 35, pos.y - 70, 16, 28);
  rectMode(CORNER);
}
}
