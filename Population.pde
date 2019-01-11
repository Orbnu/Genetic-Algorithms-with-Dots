class Population {
  Dot[] dots;
  float fitnessSum;
  int gen = 1;

  int bestDot = 0;

  int minStep = 400;

  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }

  //--------------------------------------------------

  void show() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
  }

  //-----------------------------------------------------

  void update() {
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].brain.step > minStep) {
        dots[i].dead = true;
      } else {

        dots[i].update();
      }
    }
  }

  //---------------------------------------------------

  void calculateFitness() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].calculateFitness();
    }
  }

  //------------------------------------------------------

  boolean allDotsDead() {
    for (int i = 0; i < dots.length; i++) {
      if (!dots[i].dead && !dots[i].reachedGoal) {
        return false;
      }
    }
    return true;
  }

  //---------------------------------------------------

  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    calculateFitnessSum();

    newDots[0] = dots[bestDot].getBaby();
    newDots[0].isBest = true;
    
    for (int i = 1; i < newDots.length; i++) {

//-----------------SELECT 2 PARENTS---------------------------<<<<<<<<<<<<<<<<<<<<
      // select parent based on fitness
      //Dot parent = selectParent();
      Dot parent1 = selectParent();
      Dot parent2 = selectParent();
      newDots[i] = new Dot();
      //newDots[i] = parent1.getBaby();
      newDots[i] = newDots[i].crossover(parent1,parent2);
      //get baby from them ------------- MAKE BABY FROM PARENTS INSTEAD in brain.clone and dot.getBaby

      
      // choose second parent, replace the first part of newDots with the data from the second parent
    }
    
    
    
    dots = newDots.clone();
    gen ++;
  }

  //-----------------------------------------------------

  void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i < dots.length; i++) {
      fitnessSum += dots[i].fitness;
    }
  }

  //-----------------------------------------------------


  Dot selectParent() {
    float rand = random(fitnessSum);

    float runningSum = 0;

    for (int i = 0; i < dots.length; i++) {
      runningSum += dots[i].fitness;
      if (runningSum > rand) {
        return dots[i];
      }
    }

    //should never get to this point
    return null;
  }

  //-----------------------------------------------------

  void mutation() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].brain.mutate();
    }
  }

  //------------------------------------------------------

  void setBestDot() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].fitness > max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }

    bestDot = maxIndex;
    System.out.println("Generation " + (gen + 1));

    if (dots[bestDot].reachedGoal) {
      minStep = dots[bestDot].brain.step;
    }
  }
}
