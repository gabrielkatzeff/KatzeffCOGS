float r, g, b;
float x;
float y;
float xspeed;
float yspeed;
PImage img; //declare img variable

void setup() {
  fullScreen();
  x=random(255);
  y=random(255);
  xspeed=4;
  yspeed=4;
  img=loadImage("DVD_logo.jpg"); //initialise downloaded image
  img.resize(width/10,height/10);
  r=random(255);
  g=random(255);
  b=random(255);
}


void draw() {
  background(0);
  tint(r, g, b);
  image(img, x, y);
  x=x+xspeed;
  y=y+yspeed;
  if (x+width/10>width){
    xspeed=-xspeed;
      colourpick();
  }
  if (x<0){
    xspeed=-xspeed;
    colourpick();
  }
  if (y+height/10>height){
    yspeed=-yspeed;
    colourpick();
  }
  if (y<0){
    yspeed=-yspeed;
    colourpick();
  }
}


void colourpick(){
  r=random(100,255);
  g=random(100,255);
  b=random(100,255);
}
