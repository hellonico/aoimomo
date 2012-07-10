

float inc = 0.1;

void setup() 
{
  size(displayWidth, displayHeight, OPENGL);
  noStroke();
  fill(random(255),random(255),random(255));
}

void draw() 
{
  background(0);
  // cannot get light to work on my android handset :|
  //lights(); 
  //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  inc +=0.05;
  
  pushMatrix();
  translate(width/2, height/2);
  rotateX(inc);
  rotateY(inc);
  rotateZ(inc);
  box(150);
  popMatrix();
}

