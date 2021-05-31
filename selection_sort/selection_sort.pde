int[] randoms;
int loopCounter = 0;
int sortedDepth = 0;
int lowNumber = -1;
int lowNumberIndex = -1;
int frameCount = 0;

final int quantity = 100;
final int max = 200;

void setup() {
  size(1000, 1000);
  
  randoms = new int[quantity];
  
  for (int i=0; i<quantity; i++) {
    randoms [i] = (int)random(1, max);
  }
}

void draw() {
  background(0);
  bars();
  sortStep();
}

void sortStep() {
  // Post sort break
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
  }
  
  loopCounter++;
  return;
}

void bars() {
  float smaller = min(height, width);
  float widthOffset = smaller/30;
  float heightOffset = smaller/30;
  float barWidth = (width - widthOffset * 2) / quantity;
  float maxBarHeight = (height - heightOffset * 2);

  colorMode(HSB, max, max, max);
  
  float currentBar = 0;

  for (int i=0; i<quantity; i++) {
    currentBar = maxBarHeight * randoms[i]/max;
    float centerOffSet = (height / 2) - currentBar/2;
    if (i < sortedDepth || sortedDepth == quantity - 1) {
      fill(randoms[i], max, max);
    } else if (i == loopCounter) {
      fill(max); 
    } else {
      fill(max / 2); 
    }
    rect(widthOffset + i * barWidth,
    centerOffSet,
    barWidth,
    currentBar);
  } 
}
