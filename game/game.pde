
ArrayList<Predator> predators;
ArrayList<Prey> prey;

void setup() {
  size (640, 360);
  noStroke();
  
  predators = new ArrayList<Predator>();
}


void draw() {
  background(255);
  
    for (int i = predators.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Predator predator = predators.get(i);

    predator.display();
    }  

}

void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  predators.add(new Predator(mouseX, mouseY, Direction.N));
}

void keyPressed() {
  if (key == 'a') {
    for (int i = predators.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Predator predator = predators.get(i);
    predator.turnLeft();
    }
  } else if (key == 'd') {
    for (int i = predators.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Predator predator = predators.get(i);
    predator.turnRight();
    } 
  } else if (key == 'w') {
    for (int i = predators.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Predator predator = predators.get(i);
    predator.moveForeword();
    }
  }
}
