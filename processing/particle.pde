class Particle {

  private PVector pos;
  private PVector vel;
  private PVector acc;
  private float maxspeed;
  float h;
  boolean forward;

  private PVector prevPos;

  Particle() {
    h=0;
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    prevPos = pos.copy();
    maxspeed = 4;
    forward = false;
  }

  void Reset() {
    vel.x = 0;
    vel.y = 0;
    acc.x = 0;
    acc.y = 0;
    NewParticlePos();
  }

  void Update() {
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxspeed);
    acc.mult(0);
  }

  private void ApplyForce(PVector force) {
    acc.add(force);
  } 

  void Show() {
    stroke(0,3);
    strokeWeight(1);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    UpdatePrevious();
  }

  private void NewParticlePos() {
    pos.x = random(width);
    pos.y = random(height);
    UpdatePrevious();
  }
  //keep particles inside edges of window
  void EdgeCheck() {
    if (pos.x > width ||pos.x < 0) {    
      NewParticlePos();
    }
    if (pos.y > height || pos.y < 0 ) { 
      NewParticlePos();
    }
  }


  void UpdatePrevious() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  void FollowFlow(PVector[] vectors) {
    int x = int(floor(pos.x-1))/scl;
    int y = int(floor(pos.y-1))/scl;
    int index = x+y*cols;
    if(index>=vectors.length){return;}
    ApplyForce(vectors[index]);
  }
}
