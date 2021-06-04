int[] insRandoms;
int[] quickRandoms;

// drawing globals

float offset;
float barWidth;
float maxBarHeight;

// insertion sort
int loopCounter = 0;
int sortedDepth = 0;
int lowNumber = -1;
int lowNumberIndex = -1;
int insComparisons = 0;

// quick sort
int stack[];
int quickComparisons = 0;

/*
  quick sort
  
  doing a frame for every swap, and having the edges and the pivot highlighted is
  probably the simplest way to indicate what's being worked on
    boundaries labelled red, then pivot laelled white. order matters and the pivot
    is more important to see than both boundaries
  
  recursion handles the management of expanding and collapsing the stack automatically.
  have a boolean to indicate whether we're going down or up the iteration instead?
*/

int frameCount = 0;

final int quantity = 30;
final int max = 200;

/*
  two copies of visualization, 
    selection sort on top
    quick sort on the bottom
  
  stepwise implementation of quicksort so 
    it keeps pace with insertion sort
   
  Visualize the current range in a different color
  
  add a counter for each sorting algorithm to count the comparisons
    print the counter values to the console
   
  quicksort must be implemented iteratively, not recursively
  -- this is expected to be challenging --
*/

void setup() {
  size(1000, 1000);
  offset = min(height, width)/30;
  barWidth = (width - offset * 2) / quantity;
  maxBarHeight = (height - offset * 2) / 2;
  
  insRandoms = new int[quantity];
  
  for (int i=0; i<quantity; i++) {
    insRandoms [i] = (int)random(1, max);
  }
  
  quickRandoms = new int[quantity];
  arrayCopy(insRandoms, quickRandoms);
}

void draw() {
  background(0);
  insBars();
  quickBars();
  insertionSort(insRandoms);
  quickSort(quickRandoms);
}

void quickSort(int[] array) {
  quickPartition(array);
  
  
}

int quickPivot(int[] array) {
  int[] indexes = { 0, array[array.length/2], array.length - 1 };
  int temp = 0; 
  
  // sort first two
  if (array[0] > array[indexes[1]]) {
    temp = array[0];
    array[0] = array[indexes[1]];
    array[indexes[1]] = temp;
  } 
  
  // sort second two
  if (array[indexes[1]] > array[indexes[2]]) {
    temp = array[indexes[1]];
    array[indexes[1]] = array[indexes[2]];
    array[indexes[2]] = temp;
  }
  
  quickComparisons += 2;
  
  return array[indexes[1]];
}

void quickPartition(int[] array) {
  //int pivot = quickPivot(array);
  
}

void insertionSort(int[] randoms) {
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
  
  insComparisons++;
  loopCounter++;
  return;
}

void insBars() {
  colorMode(HSB, max, max, max);
  
  float currentBar = 0;

  for (int i=0; i<quantity; i++) {
    currentBar = maxBarHeight * insRandoms[i]/max;
    float centerOffSet = (height / 4) - currentBar/2;
    if (i < sortedDepth || sortedDepth == quantity - 1) {
      fill(insRandoms[i], max, max);
    } else if (i == loopCounter) {
      fill(max); 
    } else {
      fill(max / 2); 
    }
    rect(offset + i * barWidth,
    centerOffSet,
    barWidth,
    currentBar);
  } 
}

void quickBars() {
  colorMode(HSB, max, max, max);
  
  float currentBar = 0;
  for (int i=0; i<quantity; i++) {
    currentBar = maxBarHeight * quickRandoms[i]/max;
    float centerOffSet = height / 2 + height / 4 - currentBar/2;
    if (i < sortedDepth || sortedDepth == quantity - 1) {
      fill(quickRandoms[i], max, max);
    } else if (i == loopCounter) {
      fill(max); 
    } else {
      fill(max / 2); 
    }
    rect(offset + i * barWidth,
    centerOffSet,
    barWidth,
    currentBar);
  } 
}
