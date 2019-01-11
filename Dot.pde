class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  
  float fitness = 0;
  
  Dot(){
    brain = new Brain(1000);
    
    pos = new PVector(width/2,height-10);
    vel = new PVector(0,0);
    acc = new PVector (0,0);
    
  }

  //-----------------------------------------------------------
  
  void show() {
    if(isBest) {
     fill(0,255,0); 
     ellipse(pos.x,pos.y,8,8);
      
    } else {
    
      fill(240);
      ellipse(pos.x,pos.y,4,4);
    }
  }
  
  //-----------------------------------------------------------
  
  void move() {
    if (brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
       dead = true; 
    }

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
   
  }
  
  //-----------------------------------------------------------
  
  void update() {
    if(!dead && !reachedGoal) {
      move();
      if(pos.x < 2 || pos.y < 2 || pos.y > height-2 || pos.x > width-2) {
        dead = true;
        
      } else if(dist(pos.x,pos.y,goal.x,goal.y) < 5) {
        //if reached goal
       reachedGoal = true;
        
      } else if (pos.x < 600 && pos.y < 310 && pos.x > 0 && pos.y > 300) {
        dead = true;
        //rectangle 1
      }else if (pos.x < 800 && pos.y < 510 && pos.x > 200 && pos.y > 500) {
        dead = true;
        //rectangle 2
      }else if (pos.x < 800 && pos.y < 130 && pos.x > 300 && pos.y > 120) {
        dead = true;
        //rectangle 3
      }else if (pos.x < 420 && pos.y < 430 && pos.x > 380 && pos.y > 390) {
        dead = true;
        //rectangle 4
      }else if (pos.x < 120 && pos.y < 740 && pos.x > 80 && pos.y > 700) {
        dead = true;
        //rectangle 5
      }else if (pos.x < 690 && pos.y < 660 && pos.x > 650 && pos.y > 620) {
        dead = true;
        //rectangle 6
      }else if (pos.x < 730 && pos.y < 240 && pos.x > 690 && pos.y > 200) {
        dead = true;
        //rectangle 7
      }else if (pos.x < 50 && pos.y < 140 && pos.x > 10 && pos.y > 100) {
        dead = true;
        //rectangle 8
      }
    }
  }
  
  //------------------------------------------------------------
  
  void calculateFitness() {
    if (reachedGoal) {
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
      
    } else {
      float distanceToGoal = dist(pos.x,pos.y,goal.x,goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  
   //clone it
  Dot getBaby() {
   Dot baby = new Dot();
   baby.brain = brain.clone();
   return baby;
    
  }
  
}
