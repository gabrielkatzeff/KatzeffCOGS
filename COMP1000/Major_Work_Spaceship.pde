float shipx;
float shipy;
float shipspeed = 5;
float missilex =50000;
final float mispeed = 3;
float missiley;
final float mspeed = 1.7;
int moonidx = 6;
PVector[] moons = new PVector[moonidx];
int level = 1;
int hits = 0;
int missileidx =0;
float moonX;
float moonY;
final float moonD=100;
boolean gameStart;
boolean gameWin;
int staridx = 100;
//big stars will appear closer by being larger in diameter, brighter in colour, and moving at a faster speed
float[] bigstard= new float[staridx];
PVector[] bigstars = new PVector[staridx];
int[] bigstarc  = new int[staridx];
float[] bstarsp = new float[staridx];
//small stars will appear further by being smaller in diameter, darker in colour, and moving slower(smstars, smstars, smstard, smstarc, smstarsp);
PVector[] smstars = new PVector[staridx];
float[] smstard = new float[staridx];
int[] smstarc = new int[staridx];
float[] smstarsp = new float[staridx];


void setup () {
  size(500, 500); // The screen must be 500 pixels wide and 500 pixels high
  smooth();
  textSize(34);
  shipx=40;
  shipy =30;
  gameStart = false;
  gameWin = false;
  //iterate through the stars arrays and initialise a randomised x and y value
  for (int i = 0; i<staridx; i++) {
    bigstars[i] = new PVector (random(width), random(height));
    smstars[i] = new PVector (random(width), random(height));
  }
  //iterate through the bigstars array and assign each index a random float colour 
  //close stars should be brighter
  for (int j =0; j<staridx; j++) {
    bigstarc[j] = floor(random(100, 255));
    smstarc[j] = floor(random(50, 150));
  }
  //iterate through the bigstard array and initialise a randomise (but large) diameter, opp for small stars
  for (int k =0; k<staridx; k++) {
    bigstard[k] = random(10, 15);
    smstard[k] = random(5, 12);
  }
  for (int l=0; l<staridx; l++) {
    //both small and big stars need to have randomised speed faster than the mspeed = 3
    //big stars will appear closer by being larger in diameter, brighter in colour, and moving at a faster speed
    bstarsp[l] = random(5, 6);
    smstarsp[l] = random(3, 4);
  }
  moonCreate(); //create the moons according to the moonidx
}

void draw() {
  background(0);
  startbutton();
  if (gameStart == true) { //game will only start if startbutton pressed
    stars(bigstars, bigstars, bigstard, bigstarc, bstarsp); //draws big stars
    stars(smstars, smstars, smstard, smstarc, smstarsp); //draws small stars
    drawPlayer(shipx, shipy); //draws the player
    collision(); 
    aniMoon();
    drawMissile(missilex, missiley); //draws missile
    missilex+=mispeed;
    gameOver();
    gameWon();
  }
}


void drawPlayer(float x, float y) { //Space ship starting top left screen but visible. 
  fill(255);
  PVector topCorner = new PVector (x-20, y+15);
  PVector tip = new PVector (x+15, y);
  PVector bottomCorner = new PVector(x-20, y-15);
  if (keyPressed == true) {
    //turned down version of the player
    if (key == 's') {
      topCorner.y-=10;
      shipy+=shipspeed;
    }
    //turned up version
    if (key == 'w') {
      bottomCorner.y+=10;
      shipy-=shipspeed;
    }
    if (key == ' ') {
      triangle(topCorner.x, topCorner.y, bottomCorner.x, bottomCorner.y, tip.x, tip.y);
    }
  }
  //Draws player with either normal or adjusted elements
   triangle(topCorner.x, topCorner.y, bottomCorner.x, bottomCorner.y, tip.x, tip.y);
}


void stars(PVector[] x, PVector[] y, float[] d, color[] c, float[] s) {
  for (int i =0; i<staridx; i++) {
    fill(c[i]);
    circle(x[i].x, y[i].y, d[i]);
    x[i].x-=s[i];
    if (x[i].x<0) {
      y[i].y = random(height);
      x[i].x = width;
    }
  }
}

void moonCreate() {
  for (int m = 0; m < moonidx; m++) {
    moons[m] = new PVector(width + (200*m), random(height));
  }
}

void aniMoon() {
  for (int i = 0; i < moonidx; i++) {
    drawMoon(moons[i].x, moons[i].y);
    moons[i].x -= mspeed;
    //LEVEL 1 - 3 MOONS
    if (level == 1) {
      showLevel();
      moonidx = 3;
      if (hits == 3) {
        level++;
        moonRefresh();
      }
    }
    //LEVEL 2 - 4 MOONS
    if (level == 2) {
      showLevel();
      moonidx = 4;
      if (hits == 7) {
        level++;
        moonRefresh();
      }
    }
    //LEVEL 3 - 5 MOONS
    if (level == 3) {
      showLevel();
      moonidx = 5;
      if (hits == 12) {
        level++;
        moonRefresh();
      }
    }
    //LEVEL 4 - 6 MOONS
    if (level ==4) {
      showLevel();
      moonidx = 6;
      if (hits == 18) {
        gameWin = true;
      }
    }
  }
}


void moonRefresh() {
  for (int i =0; i < moonidx; i++) {
    moons[i].x = (width+100) + 200 *i;
  }
}


void drawMoon(float x, float y) {
  fill(255);
  circle(x, y, moonD);
}

void collision() {
  for (int i =0; i < moonidx; i++) {
    if (missilex + 5 >= moons[i].x - 50 && missilex - 5 <= moons[i].x + 50 && missiley -5 >= moons[i].y -50 && missiley +5 <= moons[i].y + 50) {
      moons[i].x = 1000000000;
      moons[i].y = random(height);
      moons[i].x -= mspeed;
      missilex = 2000000000;
      hits++;
    }
  }
}


void missileRefresh() {
  if (gameStart ==true) {
    if (missilex>500) {
      if (keyPressed) {
        if (key == ' ') {
          missileidx++;
          missilex = shipx+15;
          missiley = shipy;
        }
      }
    }
  }
}


void drawMissile(float x, float y) {
  if (gameStart ==true) {
    missileRefresh();
    fill(#E330CE);
    circle(x, y, 10);
  }
}

void showLevel(){
  textAlign(CENTER);
  textSize(16);
  fill(255);
  text("Level "+ level+ "    moons destroyed "+ hits+"/18", width/2, 20);
}

void keyPressed() {
}

void keyReleased() {
} 

void mousePressed() {
}


void gameWon() {
  if (gameWin) {
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(16);
    fill(255);
    rect(width/2, height/2, 100, 80);
    fill(0);
    text("YOU WON!!", width/2, height/2);
    if (mouseX>=width/2-50 && mouseX<=width/2+50) {
      if (mouseY>=height/2-40 && mouseY<=height/2+40) {
        fill(135);
        rect(width/2, height/2, 100, 80);
        fill(255);
        text("Exit?", width/2, height/2);
        if (mousePressed) {
          exit();
        }
      }
    }
  }
}


void startbutton() {
  if (gameStart == false) {
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(16);
    fill(255);
    rect(width/2, height/2, 100, 80);
    fill(0);
    text("Start Game?", width/2, height/2);
    if (mouseX>=width/2-50 && mouseX<=width/2+50) {
      if (mouseY>=height/2-40 && mouseY<=height/2+40) {
        fill(135);
        rect(width/2, height/2, 100, 80);
        fill(255);
        text("Start Game?", width/2, height/2);
        if (mousePressed) {
          gameStart = true;
        }
      }
    }
  }
}

void gameOver() {
  for (int i = 0; i< moonidx; i++) {
    if (gameWin == false) {
      if (moons[i].x<0 || (shipx+15 >= moons[i].x - moonD/2 && shipy-15  >= moons[i].y - moonD/2 && shipy +15 <= moons[i].y+moonD/2)) { //doesn't like this one
        rectMode(CENTER);
        textAlign(CENTER);
        textSize(16);
        fill(255);
        rect(width/2, height/2, 100, 80);
        fill(0);
        text("Game Over", width/2, height/2);
        if (mouseX>=width/2-50 && mouseX<=width/2+50) {
          if (mouseY>=height/2-40 && mouseY<=height/2+40) {
            fill(135);
            rect(width/2, height/2, 100, 80);
            fill(255);
            text("Exit?", width/2, height/2);
            if (mousePressed) {
              exit();
            }
          }
        }
      }
    }
  }
}
