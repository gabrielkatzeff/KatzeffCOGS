void setup() {
  size(500, 500);
  background(255);
  grid();
}

void draw() {
}

void mousePressed() {
  grid();
}

void cells(int gridX, int gridY, int c) {
  c = colourpicker();
  fill(c);
  strokeWeight(1);
  stroke(255);
  int squarex = gridX;
  int squarey = gridY;
  rect(squarex, squarey, 50, 50);
}

int colourpicker() {
  int c= color(random(255), random(255), random(255));
  return c;
}

void grid() {
  for (int i =0; i<=width; i+=50) {
    for (int j=0; j<=height; j+=50) {
      int c=colourpicker();
      cells(i, j, c);
    }
  }
}
