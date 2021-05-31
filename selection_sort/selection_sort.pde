int[] randoms;
int loopCounter = 0;
int sortedDepth = 0;
int lowNumber = -1;
int lowNumberIndex = -1;
int frameCount = 0;

final int quantity = 40;

/*
  implement selection sort
  has to do one discrete step per frame in the draw loop
  array element swap function
  visual cue to show which elements are sorted
*/

void setup() {
  size(1000, 1000);
  
  randoms = new int[quantity];
  
  for (int i=0; i<quantity; i++) {
    randoms [i] = (int)random(200);
  }
}

void draw() {
  background(0);
  bars();
  sortStep();
}

void sortStep() {
  if (sortedDepth == quantity - 1) {
    noLoop();
    return;
  }
  // Setting low number values for comparison
  if (lowNumber == -1) {
    lowNumber = randoms[loopCounter];
    lowNumberIndex = loopCounter;
  } else if (lowNumber > randoms[loopCounter]) {
    lowNumber = randoms[loopCounter];
    lowNumberIndex = loopCounter;
  }
  
  // perform swap
  if (loopCounter == randoms.length - 1) {
    randoms[lowNumberIndex] = randoms[sortedDepth];
    randoms[sortedDepth] = lowNumber;
    
    lowNumber = -1;
    lowNumberIndex = -1;
    
    loopCounter = sortedDepth;
    sortedDepth++;
    //return;
  }
  
  loopCounter++;
  return;
}

void bars() {
  float smaller = min(height, width);
  float widthOffset = smaller/10;
  float heightOffset = smaller/10;
  float barWidth = (width - widthOffset * 2) / quantity;
  float maxBarHeight = (height - heightOffset * 2);

  colorMode(HSB, 200, 200, 200);
  
  float currentBar = 0;

  for (int i=0; i<quantity; i++) {
    currentBar = maxBarHeight * randoms[i]/200;
    float centerOffSet = (height / 2) - currentBar/2;
    if (i < sortedDepth || sortedDepth == quantity - 1) {
      fill(randoms[i], 200, 200);
    } else if (i == loopCounter) {
      fill(200); 
    } else {
      fill(100); 
    }
    rect(widthOffset + i * barWidth,
    centerOffSet,
    barWidth,
    currentBar);
  } 
}