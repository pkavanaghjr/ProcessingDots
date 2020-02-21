/* @pjs preload="graffiti.jpg,america.jpg,tree.jpg,fruit.jpg"; */
int canvasWidth;
int canvasHeight;
//MyObject myObject;

PImage img;
int tileScale = 10;
int x, y;
float xOut = 0.0, yOut = 0.0;
float diffuse = 0.5;
float t = 0.0;
float dt = 0.01;
float max_distance;
int min = 4;
int dis = 10;
float pulse = 5;
boolean imageChosen = false;
float z;

void setup() {
  // These statements are for when the code is previewed in Processing.
  //canvasWidth = displayWidth/2;
  //canvasHeight = displayHeight/2;

  // These statements are for when the code is previewed in a browser.
  canvasWidth = canvas.width;
  canvasHeight = canvas.height;

  console.log("from setup function: "+canvasWidth);
  //println("setup: "+canvasWidth);

  size(canvasWidth, canvasHeight);
  frameRate(30);
  smooth();
  noStroke();  
  colorMode(RGB, 255);
  background(255);
  ellipseMode(CORNER);
//  img = loadImage("fruit.jpg");
//  img.resize(canvasWidth/10, canvasHeight/10);
}

void resizeProcessing(float cw, float ch) {
  //console.log("from resizeProcessing function: "+cw);
  //println("resizeProcessing: "+cw);
}

void chooseImage(String imageChoice) {
  if (imageChoice == "dotOne") {        
    img = loadImage("graffiti.jpg");
    img.resize(canvasWidth/10, canvasHeight/10);
  } else if (imageChoice == "dotTwo") {
    img = loadImage("america.jpg");
    img.resize(canvasWidth/10, canvasHeight/10);
  } else if (imageChoice == "dotThree") {
    img = loadImage("tree.jpg");
    img.resize(canvasWidth/10, canvasHeight/10);
  } else if (imageChoice == "dotFour") {
    img = loadImage("fruit.jpg");
    img.resize(canvasWidth/10, canvasHeight/10);
  }
  imageChosen = true;
}


void draw() {
  if (imageChosen == true) {
  
  float pointChange = map(mouseX, 0, width, 0, 25);
    float opacityChange = map(mouseY, 0, height, 0, 255);
    background(255);  
    noStroke();

    // Draw an ellipse at that location with that color
    img.loadPixels();
    for (int i=0; i<img.width; i++) {
      for (int j=0; j<img.height; j++) {               

        x = i*tileScale;
        y = j*tileScale; 

        int loc = i + j*img.width;      

        float r = red(img.pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue(img.pixels[loc]);      

        if (key == 'o' || key == 'O') {
          // OPACITY
          fill(r, g, b, opacityChange);
          ellipse(x, y, tileScale, tileScale);
        } else if (key == 'b' || key == 'B') {
          // BLUE
          fill(r, g, map(b, 0, 255, 175, 255), opacityChange);
          ellipse(x, y, tileScale, tileScale);
        } else if (key == 'e' || key == 'E') {
          // EXPLODE
          // Calculate a z position as a function of mouseX and pixel brightness
          z = (mouseX / float(width)) * brightness(img.pixels[loc]);
          pushMatrix();
          translate(x + 200, y + 100, z);
          fill(r, g, g, 240);
          ellipse(x, y, tileScale, tileScale);
          popMatrix();          
        } else if (key == 'g' || key == 'G') {
          // GREEN
          fill(r, map(g, 0, 255, 175, 255), b, 240);
          ellipse(x, y, pointChange, pointChange);
        } else if (key == 'l' || key == 'L') {
          // LIGHTS OUT
          float distance = dist(x, y, mouseX, mouseY);
          float adjustBrightness = (150-distance)/150;
          r *= adjustBrightness;
          g *= adjustBrightness;
          b *= adjustBrightness;
          // Constrain RGB to between 0-255
          r = constrain(r, 0, 255);
          g = constrain(g, 0, 255);
          b = constrain(b, 0, 255);
          // Make a new color and set pixel in the window
          fill(r, g, b, 240);
          ellipse(x, y, tileScale, tileScale);
          //      } else if (key == 'o' || key == 'O') {
          // ORANGE
          //        fill(map(r, 0, 255, 150, 210), map(g, 0, 255, 30, 100), b, opacityChange);        
          //        ellipse(x, y, tileScale, tileScale);
        } else if (key == 'n' || key == 'N') {
          // NIGHTVISION
          fill(map(r, 0, 255, 120, 160), g, map(b, 0, 255, 160, 210), opacityChange);        
          ellipse(x, y, pointChange, pointChange);
        } else if (key == 'p' || key == 'P') {
          // PULSE                       
          t+=dt;
          float size = dist(x, y, mouseX, mouseY);
          max_distance = dist(0, 0, width/tileScale, height/tileScale);
          size = size/max_distance * dis;              
          fill(r, g, b, 240);
          ellipse(x, y, size+(sin(size*pulse*t+min)), size+(sin(size*pulse*t+min)));
        } else if (key == 'r' || key == 'R') {
          // RED
          fill(map(r, 0, 255, 175, 255), g, b, opacityChange);
          ellipse(x, y, pointChange, pointChange);
        } else if (key == 's' || key == 'S') {
          // SIZE
          fill(r, g, b, 240);
          ellipse(x, y, pointChange, pointChange);
        } else if (key == 't' || key == 'T') {
          // TORNADO
          float size = dist(x, y, mouseX, mouseY);                
          fill(r, g, b, 240);
          ellipse(x, y, size+(size*30), size+(size*30));      
          //      } else if (key == 'y' || key == 'Y') {
          // YELLOW
          //        fill(map(r, 0, 255, 160, 210), map(g, 0, 255, 180, 220), b, 240);        
          //        ellipse(x, y, pointChange, pointChange);
        } else if (key == ' ' || key == ' ') {
          // RESET
          fill(r, g, b, 240);
          ellipse(x, y, tileScale, tileScale);
        } else {
          // INITIALISE        
          fill(r, g, b, 240);
          ellipse(x, y, tileScale, tileScale);
        }
      }
    }
  }
}

