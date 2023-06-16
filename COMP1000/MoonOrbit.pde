float moonAngle; //stores the current location of the moon in degrees;
float moonAngleRadians;//converts the location of the moon into radians;
float orbitWidth; //gives width of moon's elliptical orbit
float orbitHeight; //gives height of moon's elliptical orbit
float moonX; //moons x coordinate
float moonY; //moons y coordinate
float planetx;
float planety;
float planetd=200;
float starx;
float stary;
float stardensity=50;




void setup(){
  size(500,500);
  moonAngle=40;
  orbitWidth=130;
  orbitHeight=80;
  planetx=width/2;
  planety=height/2;
  
}

void draw(){
  background(0);
  moon();
  planet();
  if(moonY>=200){
    planet();
    moon();
  }else{moonAngle=moonAngle+1;
  }
  
    
  
}


void moon(){
  noStroke();
  fill(#E6E7F5);
  circle(moonX,moonY,width/20);
  moonAngleRadians=2*PI*moonAngle/360;
  moonX=orbitWidth*cos(moonAngleRadians)+250;
  moonY=orbitHeight*sin(moonAngleRadians)+250;
  moonAngle++;
}
 
 
void planet(){
  fill(#6E76F7);
  circle(planetx,planety,planetd);
}

   
