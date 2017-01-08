ArrayList<Walker> walkers;
ArrayList<Walker> tree;
int nOfw = 1000;
int nOft = 3000;
int record=0;

int grid_w = 20;
int grid_h = 20;
int x_unit;
int y_unit;

IntList[][] index_map;


color c1 = color (211, 84, 0);
color c2 = color (37, 116, 169);
color cb = color (30, 30, 30);
void setup() {
  size(1000, 1000);
  background(cb);
  // colorMode(HSB);
  indexMapInit();
  treeInit();
  walkersInit();
}

void draw() {
  background(cb);
  println("fr:" + frameRate);
  // println("color:" + (tree.size()/float(nOft)));
  println("tree size:" + tree.size());
  for(int i = 0, n = tree.size(); i<n; i++) {
    tree.get(i).show();
  }
  for(int i = 0, n = walkers.size(); i<n; i++) {
    walkers.get(i).show();
  }

  int ite = 4000;
  while(ite > 0) {
    for(int i = walkers.size()-1; i>=0; i--) {
      Walker w = walkers.get(i);
      if (w.checkStuck(tree, index_map)){
        // tree.add(w);
        add2Tree(w);
        walkers.remove(i);
        if (tree.size() < nOft) {
          walkers.add(new Walker());
        }
      }
      w.walk();
    }
    ite--;
  }

  if (tree.size()%200 == 0) {
    if (record != tree.size() ) {
      record = tree.size();
      screenshot();
    }
  }
}
void treeInit() {
  tree = new ArrayList<Walker>();
  add2Tree(new Walker(width/2, height/2, true));
  // for (int i=0; i<50; i++) {
  //   tree.add(new Walker( width * (i/50.0), height, true));
  // }
}
// void treeInit() {
//   tree = new ArrayList<Walker>();
//   float radian = width/2.5;
//   float n = 100;
  // for (int i=0; i<n; i++) {
  //   float angle = 2 * PI * i / n;
  //   float _x = radian * cos (angle);
  //   float _y = radian * sin (angle);
  //   tree.add(new Walker(width/2 + _x, height/2 + _y, true));
  // }
// }
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

  if ( key == 's' ) {
    screenshot();
  }
}

void indexMapInit() {
  index_map = new IntList[grid_w][grid_h];
  for (int i = 0; i < grid_w; i++) {
    for (int j = 0; j < grid_h; j++) {
      index_map[i][j] = new IntList();
    }
  }

  x_unit = width / grid_w;
  y_unit = height / grid_h;
}

void add2Tree(Walker w) {
  tree.add(w);
  float xpos = w.x;
  float ypos = w.y;

  index_map[floor(xpos / x_unit)][floor(ypos / y_unit)].append(tree.size() - 1);
}

void screenshot() {
  TImage frame = new TImage(width,height,RGB,sketchPath("frame_"+nf(frameCount,5)+".png"));
  frame.set(0,0,get());
  frame.saveThreaded();
}
