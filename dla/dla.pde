ArrayList<Walker> walkers;
ArrayList<Walker> tree;
int nOfw = 100;
int nOft = 1500;
int record=0;


color c1 = color (211, 84, 0);
color c2 = color (37, 116, 169);
color cb = color (30, 30, 30);
void setup() {
  size(1000, 1000);
  background(cb);
  // colorMode(HSB);
  treeInit();
  walkersInit();
}

void draw() {
  background(cb);
  println("color:" + (tree.size()/float(nOft)));
  println("tree size:" + tree.size());
  for(int i = 0, n = tree.size(); i<n; i++) {
    tree.get(i).show();
  }
  for(int i = 0, n = walkers.size(); i<n; i++) {
    walkers.get(i).show();
  }

  int ite = 500;
  while(ite > 0) {
    for(int i = walkers.size()-1; i>=0; i--) {
      Walker w = walkers.get(i);
      if (w.checkStuck(tree)){
        tree.add(w);
        walkers.remove(i);
        if (tree.size() < nOft) {
          walkers.add(new Walker());
        }
      }
      w.walk();
    }
    ite--;
  }

  if (tree.size()%50 == 0) {
    if (record != tree.size() ) {
      record = tree.size();
      screenshot();
    }
  }
}
// void treeInit() {
//   tree = new ArrayList<Walker>();
//   // tree.add(new Walker(width/2, height/2, true));
//   for (int i=0; i<50; i++) {
//     tree.add(new Walker( width * (i/50.0), height, true));
//   }
// }
void treeInit() {
  tree = new ArrayList<Walker>();
  float radian = width/2.5;
  float n = 100;
  for (int i=0; i<n; i++) {
    float angle = 2 * PI * i / n;
    float _x = radian * cos (angle);
    float _y = radian * sin (angle);
    tree.add(new Walker(width/2 + _x, height/2 + _y, true));
  }
}
// void treeInit() {
//   tree = new ArrayList<Walker>();
//   // tree.add(new Walker(width/2, height/2, true));
//   for (int i=0; i<30; i++) {
//     tree.add(new Walker( width * (i/30.0), height, true));
//   }
//   for (int i=0; i<30; i++) {
//     tree.add(new Walker( width * (i/30.0), 0, true));
//   }
//   for (int i=0; i<30; i++) {
//     tree.add(new Walker( 0, height * (i/30.0), true));
//   }
//   for (int i=0; i<30; i++) {
//     tree.add(new Walker( width, height * (i/30.0), true));
//   }
// }
void walkersInit() {
  walkers = new ArrayList<Walker>();
  for (int i = 0; i<nOfw; i++) {
    walkers.add(new Walker());
  }
}

void keyPressed() {
  if ( key == 'a' ) {
    nOft += 100;
    for (int i = 0; i<100; i++) {
      walkers.add(new Walker());
    }
  }
}


void screenshot() {
  TImage frame = new TImage(width,height,RGB,sketchPath("frame_"+nf(frameCount,5)+".png"));
  frame.set(0,0,get());
  frame.saveThreaded();
}
