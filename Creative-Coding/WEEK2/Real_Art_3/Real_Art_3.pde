float circleSize; // Current size of the circle
float growthRate; // Rate at which the circle grows
boolean isGrowing; // Flag to check if the circle is growing

void setup() {
  size(800, 600); // Set the size of the window
  circleSize = 50; // Initial size of the circle
  growthRate = 2; // Rate of growth
  isGrowing = true; // Start with the circle growing
}

void draw() {
  background(0); // White background

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

  // Draw the circle
  fill(100, 150, 250); // Set the color of the circle
  ellipse(width / 2, height / 2, circleSize, circleSize); // Draw the circle at the center
}
