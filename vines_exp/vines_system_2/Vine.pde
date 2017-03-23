class Vine {
  int life = 10000;
  float x;
  float y;
  float angle;
  float deltaAngle = 0;
  float angleRange = 0.05;
  float step = 0.5;
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
    float dx = step * sin(angle);
    float dy = step * cos(angle);
    angle += deltaAngle;
    line(x, y, x + dx, y + dy);
    x += dx;
    y += dy;
  }
}
