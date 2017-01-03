float t;

void setup() {
  background(30);
  size(500, 500);
  t = 0;
}

void draw() {
  strokeWeight(3);
  point(f_1(t), f_2(t));
}


float f_1( float t ) {
  float ret;
  ret = sin( t / 10 );
  return ret;
}

float f_2( float t ) {
  float ret;
  ret = t;
  return ret;
}

float f_3( float t ) {

}

float f_4( float t ) {

}
