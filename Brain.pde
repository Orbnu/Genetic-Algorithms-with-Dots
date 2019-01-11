class Brain {
  PVector[] directions;
  int step = 0;
  
  //Mommy and Daddy PVectors
  PVector[] mommy;
  PVector[] daddy;

  Brain(int size) {
    directions = new PVector[size];
    randomize();
  }

  //------------------------------------------------

  void randomize() {
    for (int i=0; i< directions.length; i++) {
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle);
    }
  }

  //--------------------------------------------------

  Brain clone() {
    Brain clone = new Brain(directions.length);
    for (int i = 0; i < directions.length; i++) {
      clone.directions[i] = directions[i].copy();
    }
    return clone;
  }
  
  //mommy
  void mother() {
    mommy = new PVector[directions.length];
    for (int i = 0; i < directions.length; i++) {
      mommy[i] = directions[i].copy();
    }

  }
  
  //daddy
  void father() {
    daddy = new PVector[directions.length];
    for (int i = 0; i < directions.length; i++) {
      daddy[i] = directions[i].copy();
    }
  }
  //move this to Dot
  Brain crossover(Dot mommy, Dot daddy) {
    int crossoverPoint = Math.round(random(directions.length));
    Brain crossover = new Brain(directions.length);
    for (int i = 0; i < directions.length; i++) {
     crossover.directions[i] = mommy.brain.directions[i]; 
    }
    for (int i = 0; i < crossoverPoint; i++) {
      crossover.directions[i] = daddy.brain.directions[i];
    }
    return crossover;
  }

  //------------------------------------------------

  void mutate() {
    float mutationRate = 0.01;
    for (int i = 0; i < directions.length; i++) {
      float rand = random(1);
      if (rand < mutationRate) {
        //set this direction as a random direction
        float randomAngle = random(2*PI);
        directions[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
