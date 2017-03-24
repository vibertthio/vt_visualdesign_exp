class Circles {
  ArrayList<Circle> circles;
  ArrayList<ArrayList<Circle>> map;
  boolean steady = true;

  Circles() {
    circles = new ArrayList<Circle>();
    map = new ArrayList<ArrayList<Circle>>(nOfC * nOfR);
    for (int i = 0; i < nOfR; i++) {
      for (int j = 0; j < nOfC; j++) {
        int index = i * nOfC + j;
        // map.set(index, new ArrayList<Circle>());
        map.add(new ArrayList<Circle>());
      }
    }
  }

  void render() {
    for (int i = 0, n = circles.size(); i < n; i++) {
      Circle cir = circles.get(i);
      if (random(1) < 1e-2 && steady &&!cir.moving) {
        shift(cir);
      }
      cir.update();
      cir.render();
    }
  }

  void addCircle(int _mX, int _mY) {
    int index = round(_mY / unit) * nOfC + round(_mX / unit);
    Circle c = new Circle(_mX, _mY, unit / 2);
    map.get(index).add(c);
    circles.add(c);
  }

  void addCirclePlayer(int _mX, int _mY) {
    int index = round(_mY / unit) * nOfC + round(_mX / unit);
    Circle c = new CirclePlayer(_mX, _mY, unit / 2, this);
    map.get(index).add(c);
    circles.add(c);
  }

  void removeCircles(int _mX, int _mY) {
    int index = round(_mY / unit) * nOfC + round(_mX / unit);
    ArrayList<Circle> ls = map.get(index);
    for (int i = 0, n = ls.size(); i < n; i++) {
      circles.remove(ls.get(i));
    }
    ls.clear();
  }

  void mousePressed(int _mX, int _mY) {
    if (key == 'a') {
      addCircle(_mX, _mY);
    } else if (key == 'p') {
      addCirclePlayer(_mX, _mY);
    } else if (key == 'r') {
      removeCircles(_mX, _mY);
    }
  }

  void noteOn(Note note) {
    println();
    println("Note On:");
    println("--------");
    println("Channel:"+note.channel());
    println("Pitcsh:"+note.pitch());
    println("Velocity:"+note.velocity());
    if (note.pitch == 37) {
      steady = !steady;
    }
  }

  void debug() {
    println("-----------------------------");
    for (int i = 0, n = nOfR * nOfC; i < n; i++) {
      if (i % nOfC == 0) {
        println("");
      }
      int s = map.get(i).size();
      if (s == 0) {
        print(" " + "_" + " ");
      } else {
        print(" " + s + " ");
      }
    }
    println("");
  }


  private void shift(Circle c) {
    float k = random(1);

    int index = c.ir * nOfC + c.ic;
    int _index;
    // println("from--------");
    // println("ic : " + c.ic);
    // println("ir : " + c.ir);
    map.get(index).remove(c);
    if (k < 0.25) {
      // println("1");
      c.ic += 1;
      _index = index + 1;
      if (c.ic >= nOfC) {
        _index = c.ir * nOfC;
      }
    } else if (k < 0.5) {
      // println("2");
      c.ic -= 1;
      _index = index - 1;
      if (c.ic < 0) {
        _index += nOfC;
      }
    } else if (k < 0.75) {
      // println("3");
      c.ir += 1;
      _index = index + nOfC;
      if (c.ir >= nOfR) {
        _index -= nOfR * nOfC;
      }
    } else {
      // println("4");
      c.ir -= 1;
      _index = index - nOfC;
      if (c.ir < 0) {
        _index += nOfR * nOfC;
      }
    }
    // println("to--------");
    // println("ic : " + c.ic);
    // println("ir : " + c.ir);
    map.get(_index).add(c);
  }

  private ArrayList<Circle> getMap(int ir, int ic) {
    int index = ir * nOfC + ic;
    return map.get(index);
  }

}
