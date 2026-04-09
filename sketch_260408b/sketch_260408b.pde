ControlPanel panel;
Rocket rocket;
void setup() {
  size(400, 400);
  panel = new ControlPanel();
  rocket = new Rocket(270, 270);
}
  void draw() {
    background(255);
    panel.display();
    rocket.display();
  }
  
  void mouseReleased(){
  }
  
    
