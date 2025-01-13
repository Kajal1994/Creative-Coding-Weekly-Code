int cols = 10; // Number of columns
int rows = 10; // Number of rows
color[][] colors; // 2D array to hold colors

void setup() {
  size(800, 600);
  colors = new color[cols][rows]; // Initialize color array
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      colors[i][j] = color(255); // Set default color to white
    }
  }
}

void draw() {
  background(255); // Clear background
  float w = width / cols; // Width of each square
  float h = height / rows; // Height of each square
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      fill(colors[i][j]); // Set fill color
      rect(i * w, j * h, w, h); // Draw square
    }
  }
}

void mouseMoved() {
  float w = width / cols; // Width of each square
  float h = height / rows; // Height of each square
  int col = int(mouseX / w); // Determine column based on mouse position
  int row = int(mouseY / h); // Determine row based on mouse position
  
  // Check if the mouse is within the grid bounds
  if (col >= 0 && col < cols && row >= 0 && row < rows) {
    colors[col][row] = color(random(255), random(255), random(255)); // Change color on hover
  }
}
