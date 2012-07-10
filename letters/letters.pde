PFont font; // declares a new font variable
int ypos; // this will be sued for our yposition
int xpos; // this will be used for our xposition
float opa;   // a float is any number with decimal places ex: 2.2323434234234234
int inc;  // This will be used for moving our shapes and letters along
color col; // this is for changing the color
boolean el; // this boolean value is used as a 'switch' to runOnce();!;


void setup() {
  col = color(0, 0, 200);  // setting the color to 200 points into the blue value
  font = loadFont("agency.vlw"); // can be specified locally or by a web address
  size(1200, 100); // create a long 'banner' canvas to play with
  smooth(); // smooth so that text and shapes look clearer
  textSize(60); //our textsize is 60
  ypos=70; // y position is 70
  frameRate(120); // framerate (fps) is equal to 120
  el = false; // the starting value for this boolean is false
}



void draw() {
  background(255); // white background
  if (el == true) { // if el is true
    col = color(int(random(255)), int(random(255)), int(random(255))); // set the col (color) variable to something random
    el = false; // set el to false
  }
  inc++; // add one to inc
  xpos=inc/12; // the xposition is equal to the increment divided by 12.
  opa=mouseY*1.5; // the opacity is set to the mouseY variable multiplied by the multiplier.
  if (mousePressed) { // if the mouse has been pressed
    inc = 0; // variable inc is set to 0.
    el = true; // boolean el is now true
  }
  if(inc>1000){
//    fill(col, 80); //col is equal to three integer variables therefore we can use this instead of typing three integer variables
    inc = 1000; // set to a constant
  stroke(0, opa); // makes the stroke black
  line(50, ypos+20, 400+xpos*8, ypos+20);
  fill(col, opa);
  ellipse(xpos*10, ypos-10, 25, 25);
  }
  else{
   fill(127, 80); 
   ellipse(mouseX, mouseY, 25, 25);
  }
  
  fill(col, opa);
  text("J", 2*xpos, ypos); // This will move the J along until inc reaches 1000. the xposition is being multiplied by two and 
  text("A", 3*xpos, ypos); // this is multiplying the x position by 3 which creates spacing between the J and the A
  text("B", 4*xpos, ypos);
  text("O", 5*xpos, ypos);
  text("S", 6*xpos, ypos);
  text("T", 7*xpos, ypos);
  text("O", 8*xpos, ypos);
  text("N", 9*xpos, ypos);
  text("com", 11*xpos, ypos); // skipped a multiple for the dots position
  strokeWeight(5);
  line(50, ypos+20, 400+xpos*8, ypos+20);
//  println(inc);
//  println(xpos*2);
//  println(xpos*3);
}

