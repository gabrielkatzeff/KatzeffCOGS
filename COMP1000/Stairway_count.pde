// Implement a button that maintains a counter. Each time the button
// is clicked on, the counter is incremented by one. Each time the
// user types a key the counter is decremented by one. If the user
// clicks the mouse outside the button a square is drawn whose sides
// are of length ten times the current value of the counter.

// The top-left corner of the button
int buttonX = 10;
int buttonY = 10;

// The width and height of the button
int buttonW = 75;
int buttonH = 50;

// The counter
int count = 1;

void setup ()
{
  size (400, 400);
  background (255);
}

void draw ()
{
  // Draw the button itself
  fill (255);
  rect (buttonX, buttonY, buttonW, buttonH);

  // Draw the counter value centered inside the button
  fill (0);
  textAlign (CENTER, CENTER);
  text (count, buttonX + buttonW / 2, buttonY + buttonH / 2);
}

void mousePressed ()
{
  // If the mouse is clicked on a coordinate that is inside the
  // button rectangle
  if ((mouseX >= buttonX) &&
    (mouseX < buttonX + buttonW) &&
    (mouseY >= buttonY) &&
    (mouseY < buttonY + buttonH)) // Increment the counter
  {
    count = count + 1;
  } else  
  {
    // Clear the background to erase any previous square    
   
    // Draw the new square
    rect (0, height, width, count * 10);
    rect(0+count*10,height-count*20,width,count*10);
  }
}

void keyPressed ()
{
  // Decrement the counter making sure not to go below one
  count = count - 1; 
  background(255);
  rect (0, height, width, count * 10);
  rect(0+count*10,height-count*10,width,count*10);
  if (count < 1) 
  {
    count = 1;
  }
}
