class Predator extends Animal {
  
   Predator(float x, float y, Direction facing) {
     super(x, y, facing);
     speed = .2;
     this.aliveColor = color(0,0,200);
   }
  
}
