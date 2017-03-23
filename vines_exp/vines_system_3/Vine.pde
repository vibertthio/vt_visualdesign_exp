class Vine {
  int life = 10000;
  float x;
  float y;
  float angle;
  float deltaAngle = 0;
  float angleRange = 0.05;
  float step = 1;
  float radius = 10;

  Vine(float _x, float _y) {
    x = _x;
    y = _y;
    angle = random(-PI, PI);
  }

  void render() {

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
