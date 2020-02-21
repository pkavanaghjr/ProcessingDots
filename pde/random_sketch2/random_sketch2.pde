int canvasWidth;
int canvasHeight;
color myColor;
int xIn;
int yIn;

void setup() {
  // These statements are for when the code is previewed in Processing.
  canvasWidth = displayWidth/2;
  canvasHeight = displayHeight/2;

  // These statements are for when the code is previewed in a browser.
  //canvasWidth = canvas.width;
  //canvasHeight = canvas.height;

  //console.log("from setup function: "+canvasWidth);
  //println("setup: "+canvasWidth);

  size(canvasWidth, canvasHeight);
  smooth();
  noStroke();  
  colorMode(RGB, 255);
  background(255);

  color color1 = color(118, 193, 226, 125);
  color color2 = color(78, 188, 195, 125);
  color color3 = color(15, 177, 150, 125);
  color color4 = color(39, 142, 142, 125);
  color[] colorArray = {
    color1, color2, color3, color4
  };
  color myColor = color(colorArray[(int)random(0, 3)]);
}

void resizeProcessing(float cw, float ch) {
  //console.log("from resizeProcessing function: "+cw);
  //println("resizeProcessing: "+cw);
}

void draw() {
  background(255);

  for (int i=0; i<canvasWidth; i++) {
    for (int j=0; j<canvasHeight; j++) {
      int x = int(random(canvasWidth));
      int y = int(random(canvasHeight));
      fill(myColor, 150);
      ellipse(x, y, 25, 25);
    }
  }
}

