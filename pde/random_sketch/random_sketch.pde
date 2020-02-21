int canvasWidth;
int canvasHeight;
MyObject myObject;
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

  int xIn = int(random(canvasWidth));
  int yIn = int(random(canvasHeight));
  float wIn = 50;
  float hIn = 50;
  float opacityIn = 0;
  String fadeDirectionIn = "in";
  color color1 = color(118, 193, 226,125);
  color color2 = color(78, 188, 195,125);
  color color3 = color(15, 177, 150,125);
  color color4 = color(39, 142, 142,125);
  color[] colorArray = {
    color1, color2, color3, color4
  };
  color colorIn = color(colorArray[(int)random(0, 3)]);

  myObject = new MyObject(xIn, yIn, wIn, hIn, opacityIn, fadeDirectionIn, colorIn);
}

void resizeProcessing(float cw, float ch) {
  //console.log("from resizeProcessing function: "+cw);
  //println("resizeProcessing: "+cw);
}

void draw() {
  background(255);

  if (myObject.fadeDirection == "out") {
    myObject.diminish();
    if (myObject.isInvisible()) {
      myObject.fadeDirection = "in";
    };
  } else if (myObject.fadeDirection == "in") {
    myObject.increase();
    if (myObject.isOpaque()) {
      myObject.fadeDirection = "out";
    };
  };
  myObject.display();
}

class MyObject {
  float x;
  float y;
  float w;
  float h;
  float opacity;
  color myColor;
  String fadeDirection;
  float fadeInRate = 4;
  float fadeOutRate = 4;

  MyObject(float xIn, float yIn, float wIn, float hIn, float opacityIn, String fadeDirectionIn, color colorIn) {
    x = xIn;
    y = yIn;
    w = wIn;
    h = hIn;
    opacity = opacityIn;
    fadeDirection = fadeDirectionIn;
    myColor=colorIn;
  }

  boolean isInvisible() {    
    if (opacity==0) {
      return true;
    } else {
      return false;
    }
  }

  boolean isOpaque() {    
    if (opacity==255) {
      return true;
    } else {
      return false;
    }
  }

  void diminish() {
    if (opacity>0) {
      opacity = opacity-fadeOutRate;
    };
    if (opacity<0) {
      opacity = 0;
    };
  }

  void increase() {
    if (opacity<255) {
      opacity = opacity+fadeInRate;
    };
    if (opacity>255) {
      opacity = 255;
    };
  }

  void display() {
    fill(myColor, opacity);
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
  }
}

