//
// using ANI
// http://www.looksgood.de/libraries/Ani/
import de.looksgood.ani.*;

float x = 256;
float y = 256;

ArrayList<Ani> anis;
ArrayList anisToUnregister;

void setup() {
  size(512, 512);
  smooth();
  noStroke();

  Ani.init(this);

  anis = new ArrayList<Ani>();
  anisToUnregister = new ArrayList();
}

void draw() {
  background(255);
  fill(0);
  ellipse(x, y, 120, 120);

  updateAnis();
}

void mouseReleased() {
  // animate the variables x and y in 1.5 sec to mouse click position
  Ani.to(this, 1.5, "x", mouseX);
  Ani.to(this, 1.5, "y", mouseY);
}

// -------------------------------------------
void updateAnis(){
  if (anis.size() == 0) return;

  for (int i=0; i < anis.size(); i++) {
    Ani aniTmp = (Ani)anis.get(i);
    aniTmp.pre();
  }

  if(anisToUnregister.size() > 0) {
      for (int i=0; i < anisToUnregister.size(); i++) {
        anis.remove(i);
        anisToUnregister.remove(i);
        println("removed");
      }
  }
  println(anis.size());
}

void registerPre(Object obj) {
  anis.add( (Ani)obj );
}

void unregisterPre(Object obj) {
  int index = anis.indexOf(  (Ani)obj );
  anisToUnregister.add(index);
}
