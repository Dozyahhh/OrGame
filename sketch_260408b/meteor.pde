class Meteor {
  PVector pos;
  PVector vel;
  float size;

Meteor() {
  reset();
}
void reset() {
  pos = new PVector(random(border + 20, width - 20), - 40);
  vel = new PVector (0, random(2,5));
  size = random(30, 50);
}

void update() {
  pos.add(vel);
  if (pos.y > height + size) {
    reset();
  }
}

void display(){
  fill(140);
  ellipse(pos.x, pos.y, size, size);
  fill (200);
  noStroke();
  ellipse(pos.x -8, pos.y -5, size * 0.25, size * 0.25);
  ellipse(pos.x + 10, pos.y + 6, size * 0.2, size * 0.2);
  ellipse(pos.x - 3, pos.y + 10, size * 0.15, size * 0.15);
}
}
