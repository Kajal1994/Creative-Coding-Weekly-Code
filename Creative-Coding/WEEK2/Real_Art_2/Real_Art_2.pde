import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput audioIn;

void setup() {
  size(800, 800);
  minim = new Minim(this);
  audioIn = minim.getLineIn(Minim.MONO, 512);
  noStroke();
}

void draw() {
  background(30); // Dark background for better contrast
  
  float volume = audioIn.mix.level() * 1000; // Volume for dynamic behavior
  float pitch = audioIn.mix.get(1) * 100;   // Pitch for color and size variations

  for (int i = 0; i < (int) volume / 5; i++) { // Generate shapes based on volume
    drawRandomShape(volume, pitch);
  }
}

void drawRandomShape(float volume, float pitch) {
  pushMatrix();
  translate(random(width), random(height)); // Random position
  
  // Random color based on pitch
  fill(random(100, 255), random(100, 255 - pitch), random(100, 255), random(150, 255));
  
  int shapeType = (int) random(4); // Randomly choose a shape type
  float size = random(20, 100) + pitch; // Dynamic size
  
  switch (shapeType) {
    case 0:
      ellipse(0, 0, size, size); // Circle
      break;
    case 1:
      rect(-size / 2, -size / 2, size, size); // Rectangle
      break;
    case 2:
      arc(0, 0, size, size, random(TWO_PI), random(TWO_PI)); // Arc
      break;
    case 3:
      line(-size / 2, -size / 2, size / 2, size / 2); // Line
      break;
  }
  popMatrix();
}
