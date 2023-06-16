/**
since you are drawing the line only
when the mouse is pressed, in which
function will the line be drawn?
*/

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  
  
}

void mousePressed() {
  line(0,0,mouseX,mouseY);
}
