int[] randoms;
final int quantity = 100;

void setup() {
  size(1000, 1000);
  background(0);
  
  randoms = new int[quantity];
  
  for (int i=0; i<quantity; i++) {
    randoms [i] = (int)random(200);
  }
  
  noLoop();
}

void draw() {
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
    fill(randoms[i], 200, 200);
    rect(widthOffset + i * barWidth,
    centerOffSet,
    barWidth,
    currentBar);
  }
}
