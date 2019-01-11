Population test;
PVector goal = new PVector(400, 10);


void setup() {
  size(800, 800);
  test = new Population(1000);
}

void draw() {
  background(50);
  fill(255, 0, 0);

  ellipse(goal.x, goal.y, 10, 10);



  fill(10, 200, 255);
  rect(0, 300, 600, 10);
  //rectangle 1
  rect(200, 500, 600, 10);
  //rectangle 2
  rect(300, 120, 500, 10);
  //rectangle 3
  rect(380, 390, 40, 40);
  //rectangle 4
  rect(80, 700, 40, 40);
  //rectangle 5
  rect(650, 620, 40, 40);
  //rectangle 6
  rect(690, 200, 40, 40);
  //rectangle 7
  rect(10, 100, 40, 40);
  //rectangle 8


  text("Generation", 600, 20);
  text((test.gen), 680, 20);

  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutation();
  } else {

    test.update();
    test.show();
  }
}
