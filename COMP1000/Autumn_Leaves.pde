float circleX;
float circleY;
float dia;
float r;
float g;
float b;


void setup(){
  size(256,256);
  background(#FFCA79);
}

void draw(){
  fill(r,g,b);
  circle(circleX,circleY,dia);
 
}

void mousePressed(){
  circleX=mouseX;
  circleY=mouseY;
  dia=mouseY;
  r=mouseX;
  g=mouseY;
  b=0;

}
