class Tree {
  rule[] rules;
  int nOfr = 1;
  String axiom = "F";
  String sentence = axiom;
  int times = 4;

  float x = width / 2;
  float y = height;
  float len = 7;
  float a1 = std_angle;
  float a2 = std_angle;

  color col;
  color c1 = color (4, 147, 114);
  color c2 = color (30, 130, 76);
  color c3 = color (249, 105, 14);

  Tree(float _x, float _y, float _l, String i, String o) {
    rules = new rule[nOfr];
    rules[0] = new rule(i, o);
    x = _x;
    y = _y;
    len = _l;
    println("Start generate...");
    while(times > 0) {
      generate();
      times--;
    }
    println("Finish generate...");
    println("new sentence length :" + str(sentence.length()));
  }
  void generate() {
    String next = "";
    for(int i=0, n=sentence.length(); i<n; i++) {
      String c = str(sentence.charAt(i));
      boolean match = false;
      for(int j=0, m=rules.length; j<m; j++) {
        // println(rules[i].i);
        if (c.equals(rules[j].i)) {
          next += rules[j].o;
          match = true;
          break;
        }
      }
      if (!match) {
        next += c;
      }
    }
    sentence = next;
  }

  void display() {
    // background(60);
    noiseAngle();
    pushMatrix();
    translate(x, y);
    // stroke(200, 150);
    strokeWeight(1);
    for (int i = 0, n = sentence.length(); i < n; i++) {
      String ch = str(sentence.charAt(i));
      stroke(lerpColor(c1, c3, (float(i)/n)*0.5), 150);
      // col = lerpColor(c1, c2, float(i)/n);
      drawCorrespond(ch);
    }
    popMatrix();
  }

  void drawCorrespond(String i) {
    switch(i) {
      case "F":
          // stroke(col, 150);
          line(0, 0, 0, -len);
          translate(0, -len);
          break;
      case "+":
          rotate(a1);
          // rotate(random(angle*0.95, angle*1.05));
          break;
      case "-":
          rotate(-a2);
          // rotate(-random(angle*0.95, angle*1.05));
          break;
      case "[":
          pushMatrix();
          break;
      case "]":
          popMatrix();
          break;
      default:
          break;
    }
  }

  float xoff = 0;
  float yoff = 0;
  float zoff = random(0, 100);
  void noiseAngle() {
    xoff += 0.01;
    yoff += 0.01;
    a1 = std_angle * (0.95 + 0.1 * noise(xoff, 0, zoff));
    a2 = std_angle * (0.95 + 0.1 * noise(0, yoff, zoff));
  }


}

class rule {
  String i;
  String o;
  rule ( String _i, String _o) {
    i = _i;
    o = _o;
  }
}

float adjustAngle(float angle) {
  float min = std_angle * 0.95;
  float max = std_angle * 1.05;
  float target;
  if (random(1) > 0.5) {
    target = angle + 0.0001;
  }
  else {
    target = angle - 0.0001;
  }
  target = constrain(target, min, max);
  return target;
}
