import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput audioIn;
ArrayList<Shape> shapes = new ArrayList<Shape>();

class Shape {
  float x, y;      // Position
  float size;      // Size
  int type;        // Shape type
  color col;       // Color of the shape
  
  Shape(float x, float y, float size, int type, color col) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.type = type;
    this.col = col;
  }
  
  void display() {
    fill(col);
    noStroke();
    switch (type) {
      case 0:
        ellipse(x, y, size, size); // Circle
        break;
      case 1:
        rect(x - size / 2, y - size / 2, size, size); // Rectangle
        break;
      case 2:
        arc(x, y, size, size, random(TWO_PI), random(TWO_PI)); // Arc
        break;
      case 3:
        line(x - size / 2, y - size / 2, x + size / 2, y + size / 2); // Line
        break;
        case 4:
        drawStar(x, y, size / 2, size, 5); // Star with 5 points
        break;
    }
  }
}
void drawStar(float x, float y, float innerRadius, float outerRadius, int numPoints) {
  float angle = TWO_PI / numPoints;
  beginShape();
  for (int i = 0; i < numPoints * 2; i++) {
    float r = (i % 2 == 0) ? outerRadius : innerRadius;
    float px = x + cos(i * angle / 2) * r;
    float py = y + sin(i * angle / 2) * r;
    vertex(px, py);
  }
  endShape(CLOSE);
}
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
  // Display all shapes
  for (Shape s : shapes) {
    s.display();
  }
}

void drawRandomShape(float volume, float pitch) {
  float x = random(width);
  float y = random(height);
  float size = random(20, 100) + pitch; // Size varies with pitch
  int type = (int) random(4); // Random shape type
  color col = color(random(10, 150), random(100, 255 - pitch), random(20, 255), random(150, 235));
  
  // Add new shape to the list
  shapes.add(new Shape(x, y, size, type, col));
  }
  
  
