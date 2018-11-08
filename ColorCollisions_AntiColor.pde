////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Choose the color to avoid
color collisionColor = color(255,0,255);

//Choose the rectangle color
color rectColor = color(255,0,255);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

float x = random(0,width);
float y = 0;
float D = 25;

int extraWidth = 1;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(512,424);
}

void draw() {
  fall();
}

void fall() {
  //Reset background to keep a single, non-reproducing ellipse
  background(255);
  
  //Create the rectangle, using the specified color
  fill(rectColor);
  rect(0,mouseY,width,50);
  
  //Create the ellipse, white
  fill(255);
  ellipse(x,y,D,D);
  
  //Only change the Y coordinte if a collision is detected with the specified color
  if (!testForColor(collisionColor)) {
    y+= extraWidth;
    //Reset ellipse coordinates
    if (y > height) { y=0;x=random(0,width);}
  }
}

boolean testForColor(color c) {
  
  //A is the ellipse's Y coordinate
  int A = int(y);
  //B is the bottom of the ellipse (A + half of Diameter)
  int B = A + int(D/2);
  //C is the bottom of the ellipse with a margin (extraWidth)
  int C = B + extraWidth;
  
  //At coordinate x,C get color
  color indexColor = get(int(x),C);
  
  //If such color is the one requested,
  if (indexColor == c) {
    //Determine new Y coordinate from top of rectangle with an included margin
    A = int(C-(C-A)-extraWidth);
    //Set y to this new coordinate
    y = A;
    //Conditions are met, return true
    return true;
  } else {
    //Conditions are not met, return false.
    return false;
  }
}
