int a;
void setup(){
  size(800,800);
  background(0);
  stroke(#EA3EE2);
  a=0;
}

void draw(){
  for(int counter=0;counter<=50;counter++){
    stroke(#EA3EE2);
    line(0,a,a,height);
    line(width,height-a,width-a,0);
    line(width,0+a,width-a,height);
    line(width-a,0,0,0+a);
    a+=10;
  }
}
