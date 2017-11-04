class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector target;

  int hue;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    target = new PVector(x, y);
    hue = globalHue;

    globalHue += 1;
    if (globalHue > 255) {
      globalHue = 0;
    }
  }

  void move() {
    pos.x -= 1;
    target.x -= 1;

    float d = dist(mouseX, mouseY, pos.x, pos.y);
    if (d < 200) {
      PVector mousePos = new PVector(mouseX, mouseY);
      PVector vec = pos.copy();

      vec.sub(mousePos);
      vec.normalize();
      vec.mult(0.6);
      acc.add(vec);
    }

    PVector seek = target.copy();
    seek.sub(pos);
    seek.normalize();

    float targetDist = dist(pos.x, pos.y, target.x, target.y);
    if (targetDist < 5) {
      seek.mult(0.5 * map(targetDist, 5, 0, 1, 0));
    } else {
      seek.mult(0.5);
    }

    acc.add(seek);
    vel.mult(0.95);

    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
   }
}
