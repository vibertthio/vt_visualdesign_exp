class Vine {
  int life = 10000;
  float x;
  float y;
  float angle;
  float deltaAngle = 0;
  float angleRange = 0.05;
  float step = 1;

  private boolean breathing = true;
  private float speed = 1;
  private float speedBase = 0.1;
  private float damp = 0.2;

  Vine(float _x, float _y) {
    x = _x;
    y = _y;
    angle = random(-PI, PI);
  }

  void render(PGraphics pg) {

    if (frameCount % 60 == 0) {
      deltaAngle = random(-angleRange, angleRange);
    }
    float r = getSpeed();
    float dx = step * r * sin(angle);
    float dy = step * r * cos(angle);
    angle += deltaAngle;
    pg.line(x, y, x + dx, y + dy);
    x += dx;
    y += dy;
  }

  void triggerBreathing() {
    breathing = !breathing;
  }

  void trigger() {
    speed = 10;
  }

  private float getSpeed() {
    if (breathing) {
      return sin(frameCount / 20.0) * sin(frameCount / 20.0) + 1;
    } else {
      return speed += (speedBase - speed) * damp;
    }
  }
}
