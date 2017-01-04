ArrayList<Walker> walkers;
ArrayList<Walker> tree;



void setup() {
  size(800, 800);
  colorMode(HSB);
  tree = new ArrayList<Walker>();
  walkers = new ArrayList<Walker>();
  for (int i = 0; i<1000; i++) {
    walkers.add(new Walker());
  }
}

void draw() {
  for(int i = 0, n = tree.size(); i<n; i++) {
    tree.get(i).show();
  }
  for(int i = 0, n = walkers.size(); i<n; i++) {
    walkers.get(i).show();
  }

}





// function setup() {
//   createCanvas(400, 400);
//   colorMode(HSB);
//   // for (var x = 0; x < width; x += r * 2) {
//   //   tree.push(new Walker(x, height));
//   // }
//
//   tree[0] = new Walker(width / 2, height / 2);
//   radius *= shrink;
//   for (var i = 0; i < maxWalkers; i++) {
//     walkers[i] = new Walker();
//     radius *= shrink;
//   }
// }
