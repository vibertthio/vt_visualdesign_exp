Tree[] trees;
int nOft = 3;
String[] rules = {
  "FF+[+F+F-F]-[-F+F-F]",
  "FF+[+F-F-F]-[-F+F+F]",
  "FF+[-F-F+F]-[+F-F+F]",
  "FF+[+F-F-F]-[-F+F+F]",
  "FF+[+F-F-F]-[-F+F+F]",
};

float std_angle = radians(25);
void setup() {
  // blendMode(ADD);
  size(1600, 800);
  background(60);
  trees = new Tree[nOft];
  for (int i=0; i<nOft; i++) {
    println((float(i) / nOft));
    trees[i] = new Tree(width * ((float(i+1) / (nOft+1))), height, 10, "F", rules[i]);
  }
}

void draw() {
  background(60);
  // fill(0, 100);
  // rect(0, 0, width, height);

  println(frameRate);
  for(int i=0; i<nOft; i++) {
    trees[i].display();
  }
  if (frameCount < 300 && frameCount % 2 == 0) {
    screenshot();
  }
}

void screenshot() {
  TImage frame = new TImage(width,height,RGB,sketchPath("frame_"+nf(frameCount,5)+".png"));
  frame.set(0,0,get());
  frame.saveThreaded();
}
