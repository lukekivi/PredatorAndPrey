  enum Direction {
    N(0f,-1f),
    NE(0.5f, -0.5f),
    E(1f, 0f),
    SE(0.5f, 0.5f),
    S(0,1f),
    SW(-0.5f, 0.5f),
    W(-1f, 0f),
    NW(-0.5f, -0.5f);
    
    public final float xAngle;
    public final float yAngle;
    
    private Direction(float xAngle, float yAngle) {
      this.xAngle = xAngle;
      this.yAngle = yAngle;
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
