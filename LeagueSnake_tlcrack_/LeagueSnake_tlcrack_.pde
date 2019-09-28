//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*
class Segment {


//Add x and y member variables. They will hold the corner location of each segment of the snake.
int segmentCornerX;
int segmentCornerY;

// Add a constructor with parameters to initialize each variable.
Segment(int segmentCornerX,int segmentCornerY){
  this.segmentCornerX = segmentCornerX;
  this.segmentCornerY = segmentCornerY;
  
  
}
int getX(){
  return segmentCornerX;
}
int getY(){
  return segmentCornerY;
}
void setX(int segmentCornerX){
  this.segmentCornerX = segmentCornerX;
}
void setY(int segmentCornerY){
  this.segmentCornerY = segmentCornerY;
}

}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment snakeHead;
int foodX;
int foodY;
int snakeDirection = UP;
int foodPieces = 0;
ArrayList<Segment> segments = new ArrayList<Segment>();
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
snakeHead = new Segment(width/2, height/2);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
    
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0, 0, 0);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill(245, 2, 35);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(29,240,227);
  rect(snakeHead.getX(),snakeHead.getY(),10,10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  fill(29,240,227);
rect(132, 115, 10, 10);
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED){
    if(keyCode == UP && snakeDirection != DOWN){
      snakeDirection = UP;
    }
    if(keyCode == DOWN && snakeDirection != UP){
      snakeDirection = DOWN;
    }
    if(keyCode == LEFT && snakeDirection != RIGHT){
      snakeDirection = LEFT;
    }
    if(keyCode == RIGHT && snakeDirection != LEFT){
      snakeDirection = RIGHT;
    }
    
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(snakeDirection) {
  case UP:
    // move head up here 
    snakeHead.setY(snakeHead.getY()-10);
    break;
  case DOWN:
    // move head down here 
    snakeHead.setY(snakeHead.getY()+10);
    break;
  case LEFT:
   // figure it out 
   snakeHead.setX(snakeHead.getX()-10);
    break;
  case RIGHT:
    // mystery code goes here 
   snakeHead.setX(snakeHead.getX()+10);
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(snakeHead.getX()<=-10){
   snakeHead.setX(500);
 }
 if(snakeHead.getY()<=-10){
   snakeHead.setY(500);
 }
 if(snakeHead.getY()>=510){
   snakeHead.setY(0);
 }
 if(snakeHead.getX()>=510){
   snakeHead.setX(0);
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(snakeHead.getX() == foodX && snakeHead.getY() == foodY){
    foodPieces++;
    dropFood();
  }
}
