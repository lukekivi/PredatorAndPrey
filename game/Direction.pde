  private static float d =1/sqrt(2);

  
  enum Direction {
    N(0f, -1f, 0, -1),
    NE(d, -d, 1, -1),
    E(1f, 0f, 1, 0),
    SE(d, d, 1, 1),
    S(0,1f, 0, 1),
    SW(-d, d, -1, 1),
    W(-1f, 0f, -1, 0),
    NW(-d, -d, -1, -1);
        
    public final float xAngle;
    public final float yAngle;
    public final int xDir;          // for multiplying speed to make sure it is applied in the right direction while moving -> x1 = xAngle + (speed * xDir * acceleration)
    public final int yDir;          //    if the predator is moving north and speed is 1, summing will cause it not to move in the y direction.
                                    //    if it is multiplied by -1 then it the predator will move as expected.
    
    private Direction(float xAngle, float yAngle, int xDir, int yDir) {
      this.xAngle = xAngle;
      this.yAngle = yAngle;
      this.xDir = xDir;
      this.yDir = yDir;
    }
    
    public Direction turnRight() {
     return this.ordinal() < Direction.values().length - 1
         ? Direction.values()[this.ordinal() + 1]
         : Direction.values()[0];
    }
    
    public Direction turnLeft() {
     return this.ordinal() > 0
         ? Direction.values()[this.ordinal() - 1]
         : Direction.values()[Direction.values().length - 1];
    }
  }
