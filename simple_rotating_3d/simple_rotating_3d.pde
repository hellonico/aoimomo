void setup() {
  size(400, 400, P3D);
  noStroke();
}  

void draw() {
  background(0);
  smooth();
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/200);
  box(200);
}
