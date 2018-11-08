////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Choose the color to stay on
color collisionColor = color(255,255,255);

//Choose the rectangle color
color rectColor = color(255,0,255);

//Choose the rectangle hole color
color rectHoleColor = color(255);

//Choose the background color
color background = color(255);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

float x = random(0,width);
float y = 0;
float D = 25;

int extraWidth = 1;

String direction = "";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(512,424);
  noStroke();
}

void draw() {
  fall();
}

void fall() {
  //Reset background to keep a single, non-reproducing ellipse
  background(background);
  
  //Create the rectangle, using the specified color
  fill(rectColor);
  noStroke();
  rect(0,mouseY,width,50);
  
  //Create Rectangle Hole
  fill(rectHoleColor);
  rect(mouseX+20,mouseY,50,50);
  
  //Create the ellipse, white
  fill(255);
  stroke(0);
  ellipse(x,y,D,D);
  
  //Only change the Y coordinte if a collision is detected with the specified color
  if (!testForColor(collisionColor)) {
    y+= extraWidth;
    //Reset ellipse coordinates
    if (y >= height-(D/2)-2*extraWidth || y < 0) { y=5;x=random(0,width);}
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
  if (indexColor != c) {
    
    //Determine new Y coordinate from top of rectangle with an included margin
    A = int(C-(C-A)-extraWidth);
    //Set y to this new coordinate
    y = A;
    
    
    
    //If on left edge,
    if (x <= 0) {
      //Roll right
      x += extraWidth;
      direction = "right";
    }
    
    //If on right edge,
    else if (x >= width) {
      //Roll left
      x -= extraWidth;
      direction = "left";
    //Default
    } else {
      //If direction is left, roll left
      if (direction == "left") {
        x -= extraWidth;
        //If direction is right, roll right
      } else if (direction == "right") {
        x += extraWidth;
        //Default; direction is undefined
      } else {
        x += extraWidth;
        direction = "right";
        
      }
    }
    //DEBUG
    //print(direction);
    
    //Conditions are met, return true
    return true;
  } else {
    //Conditions are not met, return false.
    return false;
  }
}
