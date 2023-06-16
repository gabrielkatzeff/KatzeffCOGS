final int N=2+(int)random(6);//at least 2, but up to 7
size(500,500);
background(255);
strokeWeight(3);
for (int x =width/N; x<N*width/N;x+=width/N){
  for(int y=height/N;y<N*height/N;y+=height/N){
    stroke(255,0,0);
    line(x,0,0,y);
    stroke(0,0,255);
    line(width,y,x,0);
    stroke(0,255,0);
    line(width,y,x,height);
    stroke(0);
    line(0,y,x,height); 
  }
}
