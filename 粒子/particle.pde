Mover[] movers = new Mover[700];
 
void setup() {
  size(1700,1100);
  background(0);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}
 
 void draw() {
  background(0);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
 
class Mover {
 
  PVector location;
  PVector velocity;
  PVector force;
  PVector acceleration;
  float topspeed;
  float mass;
  float g;
  float r;
  float b;
  float t;
  
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 8;
    mass=random(3,8.5);
    r=random(255);
    g=random(12);
    b=random(255);
    t=random(0,190);
  }
 
  void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(random(0,1));
    force = dir;
    acceleration=force.div(mass);
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
 
  void display() {
    noStroke();
    fill(r,g,b,t);
    ellipse(location.x,location.y,3*mass,3*mass);
  }
 
  void checkEdges() {
 
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}
