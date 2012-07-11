void draw() {
 fill(0,60);
 rect(0,0,width, height);
 colorMode(HSB);
 fill(motionPressure*500,motionPressure*500,255);
 ellipse(mouseX, mouseY, motionX,motionY);
}
