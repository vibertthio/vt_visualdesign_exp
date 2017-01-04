float t;
int numberOfLine = 10;
float unit = 250;
void setup() {
  background(30);
  fullScreen();
  // size(500, 500);
  t = 0;
}

void draw() {
  // background(30);
  // strokeWeight(2);
  strokeWeight(5);
  stroke(255);
  translate(width/2, height/2);
  // point(f_1(t), f_2(t));
  // point(f_3(t), f_4(t));
  // line(f_3(t), f_4(t), f_3(t + 2), f_4(t + 2));
  // for (int i = 0; i < numberOfLine; i++) {
  //   float k = i * 5;
  //   line(f_1( t + k ), f_2( t + k ), f_3( t + k ), f_4( t + k ));
  // }

  // t += 4;
  // if ( t < 400 ) {
  //   screenshot();
  // }

  noLoop();
  drawCC();

}

void drawCC () {
  for (int t=0; t<1256; t+=2) {
    point(f_3(t), f_4(t));
  }
}

float f_1( float t ) {
  float ret;
  ret = u(1) * sin( t / 15 ) + u(2) * cos ( t / 30 );
  return ret;
}

float f_2( float t ) {
  float ret;
  ret = u(1) * cos ( t / 20 ) - u(0.6) * sin ( t / 100 );
  return ret;
}

float f_3( float t ) {
  float ret;
  ret = u(2) * sin ( t / 50 ) * cos ( t / 40);
  // ret = 100 * sin ( PI *  cos ( t / 15 ) );
  return ret;
}

float f_4( float t ) {
  float ret;
  ret = u(2) * cos ( t / 50 ) * cos ( t / 40);
  return ret;
}

void keyPressed() {
  if ( key == 'a' ) {
    noLoop();
  }
  if ( key == 'b' ) {
    loop();
  }
}

float u(float k) {
  return k * unit;
}


void screenshot() {
  TImage frame = new TImage(width,height,RGB,sketchPath("frame/frame_"+nf(frameCount,5)+".png"));
  frame.set(0,0,get());
  frame.saveThreaded();
}
