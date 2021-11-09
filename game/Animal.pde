class Animal {
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  
  float speed = 1; // Rate speed increases while traveling in a straight line.
  float acceleration = 1;
  
  boolean alive = true;
  
  color aliveColor = color(0, 200, 0);
  color deadColor = color(0);
  
  final float rotationAngle = 45;
  
  Direction facing;
  
  Animal(float x, float y, Direction facing) {
     x1 = x - 10;
     y1 = y + 20;
     x2 = x;
     y2 = y;
     x3 = x + 10;
     y3 = y + 20;
     this.facing = facing;
  }
  
  void moveForeword() {
     x1 += facing.xAngle + speed * acceleration;
     y1 += facing.yAngle + speed * acceleration;
     x2 += facing.xAngle + speed * acceleration;
     y2 += facing.yAngle + speed * acceleration;
     x3 += facing.xAngle + speed * acceleration;
     y3 += facing.yAngle + speed * acceleration;
  }
  
  void turnLeft() {  
    /* Rotate the triangle */
    // find the center
    float centerX = (x1 + x2 + x3)/3;
    float centerY = (y1 + y2 + y3)/3;
    
    // translate to origin
    float t_x1 = x1 - centerX;
    float t_y1 = y1 - centerY;
    float t_x2 = x2 - centerX;
    float t_y2 = y2 - centerY;
    float t_x3 = x3 - centerX;
    float t_y3 = y3 - centerY;
    
    // rotate
    x1 = (t_x1 * cos(-rotationAngle) - t_y1 * sin(-rotationAngle)) + centerX;
    y1 = (t_x1 * sin(-rotationAngle) + t_y1 * cos(-rotationAngle)) + centerY;
    x2 = (t_x2 * cos(-rotationAngle) - t_y2 * sin(-rotationAngle)) + centerX;
    y2 = (t_x2 * sin(-rotationAngle) + t_y2 * cos(-rotationAngle)) + centerY;
    x3 = (t_x3 * cos(-rotationAngle) - t_y3 * sin(-rotationAngle)) + centerX;
    y3 = (t_x3 * sin(-rotationAngle) + t_y3 * cos(-rotationAngle)) + centerY;
    
    
    facing = facing.turnLeft();
  }
  
  void turnRight() {
    /* Rotate the triangle */
    // find the center
    float centerX = (x1 + x2 + x3)/3;
    float centerY = (y1 + y2 + y3)/3;
    
    // translate to origin
    float t_x1 = x1 - centerX;
    float t_y1 = y1 - centerY;
    float t_x2 = x2 - centerX;
    float t_y2 = y2 - centerY;
    float t_x3 = x3 - centerX;
    float t_y3 = y3 - centerY;
    
    // rotate
    x1 = (t_x1 * cos(rotationAngle) - t_y1 * sin(rotationAngle)) + centerX;
    y1 = (t_x1 * sin(rotationAngle) + t_y1 * cos(rotationAngle)) + centerY;
    x2 = (t_x2 * cos(rotationAngle) - t_y2 * sin(rotationAngle)) + centerX;
    y2 = (t_x2 * sin(rotationAngle) + t_y2 * cos(rotationAngle)) + centerY;
    x3 = (t_x3 * cos(rotationAngle) - t_y3 * sin(rotationAngle)) + centerX;
    y3 = (t_x3 * sin(rotationAngle) + t_y3 * cos(rotationAngle)) + centerY;
    
    
     facing = facing.turnRight(); 
  }
  
  private color getColor() {
    return this.alive ? this.aliveColor : this.deadColor;
  }
  
  void display() {
    fill(getColor());
    triangle(x1, y1, x2, y2, x3, y3);
  }
}
