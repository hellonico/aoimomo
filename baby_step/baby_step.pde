// keep reference to computed 
int gw, gh;
float base = random(126);

void setup() {
     size(displayWidth, displayHeight);
     smooth();
     frameRate(5);
     background(255);
     gw = width;
     gh = height;
     println("Resolution is:"+gw+"x"+gh+" pixels");
}

void draw() {
   fill(light() , light(), light(), 50);
   ellipse(mouseX, mouseY, 80, 80); 
}

float light() {
  return random(127) + base;
}
