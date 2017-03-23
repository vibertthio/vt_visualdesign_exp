class Vine {
  float _x; // x position
  float _y; // y position
  float _a; // angle
  float _ai; // delta angle
  float _w; // width
  float _l; // life
  ArrayList<Node> _path;

  boolean _giveBirth = false;

  Vine(float x, float y, float a, float ai, float w, float l) {
    _x = x;
    _y = y;
    _a = a;
    _ai = ai;
    _w = w;
    _l = l;
    _path = new ArrayList<Node>();
  }

}

class Node {
  float _x;
  float _y;

  Node(float x, float y) {
    _x = x;
    _y = y;
  }

}
