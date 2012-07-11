// ISSUES: non-interactive sketches don't show on the screen
/**
 * Primitives 3D. 
 * 
 * Placing mathematically 3D objects in synthetic space.
 * The lights() method reveals their imagined dimension.
 * The box() and sphere() functions each have one parameter
 * which is used to specify their size. These shapes are
 * positioned using the translate() function.
 */
 
void setup() {
  size(displayWidth, displayHeight, OPENGL);
  //orientation(LANDSCAPE);
  background(0);
  

  noStroke();
  noLoop();
}

void draw() {
  lights();
    
  pushMatrix();
  translate(130, height/2, 0);
  rotateY(1.25);
  rotateX(-0.4);
  box(100);
  popMatrix();

  noFill();
  stroke(255);
  pushMatrix();
  translate(500, height*0.35, -200);
  sphere(280);
  popMatrix();
}

