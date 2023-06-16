//println("      1      ");
//println("    1 2 3    ");
//println("  1 2 3 4 5  ");
//println("1 2 3 4 5 6 7");


float dia = 10;
float maxBrightness = 200;

void setup() {
  size(250,250);
}

void draw() {
  drawCircleGrid();
}

void drawCircleGrid() {
  for (float i = dia/2; i < width; i += dia) {
    for (float k = dia/2; k < width; k += dia) {
      fill(getBrightness(mouseX, mouseY, i, k));
      circle(i, k, dia);
    }
  }
}

float getBrightness(float mouseXPos, float mouseYPos, float x, float y) {
  return maxBrightness - dist(mouseXPos, mouseYPos, x, y);
}
