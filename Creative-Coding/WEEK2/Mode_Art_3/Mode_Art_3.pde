float circleSize; // Current size of the circle
float growthRate; // Rate at which the circle grows
boolean isGrowing; // Flag to check if the circle is growing
float x; // X position of the circle
float speed; // Speed of the circle's movement
void setup() {
  size(800, 600); // Set the size of the window
  circleSize = 50; // Initial size of the circle
  growthRate = 2; // Rate of growth
  isGrowing = true; // Start with the circle growing
  x = 0; // Start position of the circle
  speed = 2; // Speed of movement
}

void draw() {
  //background(0); // White background

  // Update the size of the circle
  if (isGrowing) {
    circleSize += growthRate; // Increase size
    if (circleSize >= 200) { // Maximum size
      isGrowing = false; // Start shrinking
    }
  } else {
    circleSize -= growthRate; // Decrease size
    if (circleSize <= 50) { // Minimum size
      isGrowing = true; // Start growing again
    }
  }
   x += speed; // Move the circle to the right
  if (x > width + circleSize / 2) { // If it goes off the right edge
    x = -circleSize / 2; // Reset to the left side
  }
  // Draw the circle
  fill(100, 150, 250); // Set the color of the circle
  ellipse(x, height / 2, circleSize, circleSize); // Draw the circle at the center
}
