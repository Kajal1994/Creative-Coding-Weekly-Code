int cols = 10; // Number of columns
color[] colors; // 1D array to hold colors

void setup() {
  size(800, 100); // Set size for a single row of squares
  colors = new color[cols]; // Initialize color array with one row
  for (int i = 0; i < cols; i++) {
    colors[i] = color(255); // Set default color to white for each square
  }
}

void draw() {
  background(255); // Clear background
  float w = width / cols; // Width of each square
  
  for (int i = 0; i < cols; i++) {
    fill(colors[i]); // Set fill color
    rect(i * w, 0, w, height); // Draw a rectangle for each column
  }
}

void mouseMoved() {
  float w = width / cols; // Width of each square
  int col = int(mouseX / w); // Determine column based on mouse position

  // Check if the mouse is within the grid bounds and the column is not already colored
  if (col >= 0 && col < cols && colors[col] == color(255)) {
    colors[col] = color(random(255), random(255), random(255)); // Change color only if it's still white
  }
}
