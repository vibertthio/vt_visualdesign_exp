class Vine {
  float x;
  float y;
  float angle;
  float deltaAngle = 0;
  float angleRange = 0.05;
  float step = 0.6;
  float radius = 10;
  int life = 100;

  int depth;

  Vine(float _x, float _y) {
    x = _x;
    y = _y;
    angle = random(-PI, PI);
  }

  Vine(float _x, float _y, float _a, int _d) {
    x = _x;
    y = _y;
    angle = _a;
    depth = _d;
  }

  void render() {
    life--;
    if (frameCount % 60 == 0) {
      deltaAngle = random(-angleRange, angleRange);
    }
    float r = sin(frameCount / 20.0) * sin(frameCount / 20.0) + 1;
    float dx = step * r * sin(angle);
    float dy = step * r * cos(angle);
    angle += deltaAngle;
    line(x, y, x + dx, y + dy);
    x += dx;
    y += dy;
  }

}
