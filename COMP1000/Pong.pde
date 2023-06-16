float ypos;
int leftscore;
int rightscore;
float circleX;
float circleY;
float circleX1;
float circleY1;
float xspeed;
float yspeed;



void setup(){
  size(400,400);
  ypos=height/2;
  circleX=width/2;
  circleY=height/2;
  xspeed=2;
  yspeed=2;
  
}

void draw(){
  background(0);
  fill(255);
  rectMode(CENTER);
  noStroke();
  ypos=mouseY;
  leftscore=0;
  rightscore=0;
  
  text(leftscore,width/2-15,20);
  text(rightscore,width/2+15,20);
  
 
 
  //left pong create
  rect(width/20,ypos,20,height/10);
   
  if (circleX-width/30<=width/20+20){
    if(circleY==ypos||circleY==ypos+1||circleY==ypos+2||circleY==ypos-1||circleY==ypos-2||circleY==ypos+3||circleY==ypos-3){ //left bumper
    xspeed=xspeed*-1;
    }
  }
  
  //right pong create
  rect(width/20*19,ypos,20,height/10);
  println(leftscore);
  println(rightscore);
 
  if (circleX+width/30>=width-width/20-20){
    if(circleY==ypos||circleY==ypos+1||circleY==ypos+2||circleY==ypos-1||circleY==ypos-2||circleY==ypos+3||circleY==ypos-3){ //right bumper
    xspeed=-xspeed;
    }
  }
 //ball
  circle(circleX,circleY,width/30);
  circleX=circleX-xspeed; //ball movement width Start Left
  circleY=circleY-yspeed; //ball movement height Start Right
  if (circleY>=height||circleY<0){ //height bounce
    yspeed=-yspeed;
  }
  if(circleX<=0){
    circle(circleX,circleY,width/30);
    circleX=width/2;
    circleY=height/2;
    rightscore++;
  }
  if(circleX>=width){   
    circle(circleX,circleY,width/30);
    circleX=width/2;
    circleY=height/2;
    leftscore++;
 
    }
  }
 
  
   
