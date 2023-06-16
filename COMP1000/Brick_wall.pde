fullScreen();
background(#F0471D);
stroke(0);
strokeWeight(8);
for(int y=0;y<height;y+=40){
  line(0,y,width,y);
  if(y%80!=40){
      for(int x=0;x<width;x+=80){
        line(x,y,x,y+40);
      }
    }
  if(y%80==40){
    for(int x=40;x<width;x+=80){
    line(x,y,x,y+40);
    }
  }
}
