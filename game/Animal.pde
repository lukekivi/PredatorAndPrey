class Animal {
  
  // Thought: all of these xi's and yi's could be removed and the display function could generate a triangle
  //          based on the center. It would be a little more spacially conservative. Although, center is only
  //          needed while rotating and for algorithmic and potentially collision sensing purposes.
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  
  float centerX;
  float centerY;
  
  Direction facing;

  
  float speed = 0;           // Rate speed increases while traveling in a straight line.
  float acceleration = 1;    // Acceleration was in the move calculation before but I realized what I was doing was incorrect.
                             //   Implementing acceleration will have to involve a changing speed variable. 
  
  boolean alive = true;
  
  color aliveColor = color(0, 200, 0);
  color deadColor = color(0);
  
  final float rotationRadians = PI/4;
    
  Animal(float x, float y, Direction facing) {
    // the constants I use in here are basically dimensions for the triangle. This is kind of hacky to have these "magic numbers"
    //   I am sure there is a more graceful solution but I haven't spent the time thinking of it yet.
     x1 = x - 10;
     y1 = y + 20;
     x2 = x;
     y2 = y;
     x3 = x + 10;
     y3 = y + 20;
     this.facing = facing;
  }
  
  void moveForword() {
     x1 += facing.xDist + (speed * facing.xDir);
     y1 += facing.yDist + (speed * facing.yDir);
     x2 += facing.xDist + (speed * facing.xDir);
     y2 += facing.yDist + (speed * facing.yDir);
     x3 += facing.xDist + (speed * facing.xDir);
     y3 += facing.yDist + (speed * facing.yDir);
  }
  
  void turnLeft() {  
    rotateTriangle(-rotationRadians);
    facing = facing.turnLeft();
  }
  
  void turnRight() {
     rotateTriangle(rotationRadians);
     facing = facing.turnRight(); 
  }
  
  private color getColor() {
    return this.alive ? this.aliveColor : this.deadColor;
  }
  
  void display() {
    fill(getColor());
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  private void rotateTriangle(float rotationAngle) {
    /* Rotate the triangle */
    // find the center
    centerX = (x1 + x2 + x3)/3;
    centerY = (y1 + y2 + y3)/3;
    
    // translate to origin
    float t_x1 = x1 - centerX;
    float t_y1 = y1 - centerY;
    float t_x2 = x2 - centerX;
    float t_y2 = y2 - centerY;
    float t_x3 = x3 - centerX;
    float t_y3 = y3 - centerY;
    
    // rotate and return to original location
    x1 = (t_x1 * cos(rotationAngle) - t_y1 * sin(rotationAngle)) + centerX;
    y1 = (t_x1 * sin(rotationAngle) + t_y1 * cos(rotationAngle)) + centerY;
    x2 = (t_x2 * cos(rotationAngle) - t_y2 * sin(rotationAngle)) + centerX;
    y2 = (t_x2 * sin(rotationAngle) + t_y2 * cos(rotationAngle)) + centerY;
    x3 = (t_x3 * cos(rotationAngle) - t_y3 * sin(rotationAngle)) + centerX;
    y3 = (t_x3 * sin(rotationAngle) + t_y3 * cos(rotationAngle)) + centerY;
  }
}
