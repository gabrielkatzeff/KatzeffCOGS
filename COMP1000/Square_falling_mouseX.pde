/*
 * declare any variables required across multiple 
 * iterations of draw here.
 * NOTE: variables hold the changing aspect(s) of "stuff" in your code
 */
 
int rectx;
int recty;

void setup() {
  size(400,400);//set screen size
  background(255);//set background colour
  rectx=width/2;
  recty=0;
}

void draw() {
  background(255);//clear background
  fill(0,255,0);
  rectMode(CENTER);
  rect(rectx,recty,50,50);//draw rectangle by using the variable that holds the changing aspect
  recty++;
  
}

void mousePressed(){
  background(255);
  rectx=mouseX;
  recty=mouseY;
}
