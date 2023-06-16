PImage frog;
float frogX;
int frogLane;

float[] carX = new float[8];
float[] carSpeedX = new float[8];
float[] carWidth = new float[8];
color[] carColour = new color[8];

float TyreHeight = 25 * 0.15;
float CarBodyHeight = 25 * 0.4;
int level = 1;
int score = 0;
float min_speed;
float max_speed;

void setup() {
  size(800, 400);   
  frog = loadImage("frog.png");
  resetFrog();
  resetSpeedRange();
  //setup cars
  for (int i=0; i < 8; i++) {
    carWidth[i] = random(30, 150);
    carX[i] = random(800);
    carSpeedX[i] = random(min_speed, max_speed);
    carColour[i] = color(random(100, 255), random(100, 255), random(100, 255));
  }
}

void resetSpeedRange() {
  min_speed = 1;
  max_speed = 7;
}

void draw() {
  background(0);
  stroke(#FAE714);//yellow
  //draw lanes
  for (int i=1; i<=8; i++) {
    float y = i * 25;
    for (float x=0; x < width; x+=50) {
      line(x, y, x+20, y);
    }
  }
  //draw frog
  image(frog, frogX, frogLane * 25 + (1 - 0.7) / 2 *25, 25 * 0.7, 25 * 0.7);
  //draw cars
  for (int currentLane=0; currentLane < 8; currentLane++) {
    drawCar(carX[currentLane], currentLane * 25, carWidth[currentLane], carColour[currentLane]);
    carX[currentLane]+=carSpeedX[currentLane];
    if (carX[currentLane] >= width) {
      carX[currentLane] = -carWidth[currentLane];
      carSpeedX[currentLane] = random(min_speed, max_speed);
    }    
    if (frogLane == currentLane) {
      if (frogX >= carX[currentLane] && frogX <= carX[currentLane] + carWidth[currentLane]) {
        resetFrog();
      }
    }
  }
  //show score
  textSize(30);
  textAlign(LEFT, BOTTOM);
  fill(200);
  text("Score: "+score, 20, height - 20); 
  text("Level: "+level, 20, height - 80);
}


void drawCar(float x, float y, float cWidth, color c) {
  //wheels
  fill(255);
  rect(x + cWidth * 0.2, y, cWidth/10, TyreHeight);
  rect(x + cWidth * 0.8, y, cWidth/10, TyreHeight);
  rect(x + cWidth * 0.2, y + CarBodyHeight + TyreHeight, cWidth/10, TyreHeight);
  rect(x + cWidth * 0.8, y + CarBodyHeight + TyreHeight, cWidth/10, TyreHeight);
  //Car Body
  fill(c);
  noStroke();
  rect(x, y + 25 * 0.2, cWidth, CarBodyHeight);
}

void resetFrog() {
  frogLane = 400/25 - 1;
  frogX = 800/2 - 25/2;
}

final float INIT_SPEED = 20;
float speedX = INIT_SPEED;
final float SPEED_CHANGE = 1.1;

void keyPressed() {
  if (keyCode == UP) 
    frogLane--;
  if (keyCode == DOWN)
    frogLane++;
  if (keyCode == LEFT)
    frogX-=speedX;
  if (keyCode == RIGHT)
    frogX+=speedX;
  speedX*=SPEED_CHANGE;
}

void keyReleased() {
  speedX = INIT_SPEED;
}
