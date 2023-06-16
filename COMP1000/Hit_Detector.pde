 //<>//

void setup(){
  size(300,300);
}

void draw(){
 background(0);
 noStroke();
 fill(255);
 circle(width/2,height/2,60);
 circle(mouseX,mouseY,60);
  if(dist(width/2,height/2,mouseX,mouseY)<=60){
    fill(255,0,0);
    circle(width/2,height/2,60);
    circle(mouseX,mouseY,60);
  }
}
