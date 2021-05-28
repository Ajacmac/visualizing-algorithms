int[] randoms;
int canvasWidth = 300;
int canvasHeight = 300;

void setup() {
  size(300, 300);
  background(0);
  
  randoms = new int[100];
  
  for (int i=0; i<100; i++) {
    randoms[i] = (int)random(200);
  }
  
  noLoop();
}

/*
  Mini ref:
  rect(x, y, width, height)
*/

void draw() {
  int widthOffset = canvasWidth / 10;
  int heightOffset = canvasHeight / 10;
  
  int drawWidth = canvasWidth - (widthOffset * 2);
  int barWidth = drawWidth / randoms.length;
  //int barWidthOffset = barWidth / 2;
  
  int barHeight = (canvasHeight - heightOffset * 2);
  
  for (int i=0; i<randoms.length; i++) {
    rect(
        /* x */ widthOffset + barWidth * i,
        /* y */ heightOffset,
        /* w */ barWidth,
        /* h */ barHeight * randoms[i] / 200);
  }
}
