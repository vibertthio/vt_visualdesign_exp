ArrayList<Walker> walkers;
ArrayList<Walker> tree;
int nOfw = 1000;


void setup() {
  size(900, 900);
  background(30);
  colorMode(HSB);

  tree = new ArrayList<Walker>();
  tree.add(new Walker(width/2, height/2, true));

  walkers = new ArrayList<Walker>();
  for (int i = 0; i<nOfw; i++) {
    walkers.add(new Walker());
  }

}

void draw() {
  background(30);
  for(int i = 0, n = tree.size(); i<n; i++) {
    tree.get(i).show();
  }
  for(int i = 0, n = walkers.size(); i<n; i++) {
    walkers.get(i).show();
  }
  println(walkers.size());

  int ite = 500;
  while(ite > 0) {
    for(int i = walkers.size()-1; i>0; i--) {
      Walker w = walkers.get(i);
      if (w.checkStuck(tree)){
        tree.add(w);
        walkers.remove(i);
        walkers.add(new Walker());
      }
      w.walk();
    }
    ite--;
  }
}
