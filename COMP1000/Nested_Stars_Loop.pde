float stary;
float starx;
float stard;
float distance;


void setup(){
  size(500,500);
  stard=5;
  frameRate(2);
}

void draw(){
  background(0);
  stars();
  
  
}

void stars(){
for(float stary=5;stary<height;stary=stary+distance){
  for(float starx=5;starx<width;starx=starx+distance){
    fill(#F7F798);
    distance=random(19,20);
    circle(starx, stary, stard);
  }
}
}
