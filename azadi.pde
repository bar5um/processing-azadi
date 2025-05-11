
PGraphics geolayer;

PImage bg;
PImage tower;
void setup() {
  size(800, 521);
 // noLoop(); 
  geolayer = createGraphics(width,height);
  bg = loadImage("bg.jpg");
  tower = loadImage("tower.png");
  //frameRate(40);
}
 float theta;
 float i=1.026;
void draw() {
  
  geolayer.beginDraw();
  geolayer.clear();
  geolayer.translate(width / 2, height / 2); // centre origin
  geolayer.strokeWeight(0.10);
  geolayer.stroke(255);
  geolayer.scale(31);
  geolayer.rotate(PI/2 + theta);
  float lastx = 0;
  float lasty = 0;
  for (float u = 0 ; u < 340 ; u += i) {
    // cube root is same as raising to power of 1/3 so...
    // the 100/55th root is same as raising to power of 55/100
    float x = 0.05 * u * cos(u);
    float y = 0.05 * u * sin(u);
    geolayer.line(x, y,lastx,lasty);
    lastx=x; //<>//
    lasty=y; //<>//
  }
  //i+=0.0001;
  geolayer.endDraw();
  
 
image(bg, 0, 0);
image(geolayer,0,0);
theta+=0.02;
  image(tower, 0, 0);
  saveFrame("p###.gif");
  if(frameCount == 150) exit();
}