function setup() {
  createCanvas(windowWidth, windowHeight); // Create a canvas of 600x600 pixels
  noStroke(); // Disable outlines for shapes
}

function draw() {
  background(0); // Set background to white

  let c = 20; // Number of columns
  let r = 10; // Number of rows
  let w = width / c; // Width of each rectangle
  let h = height / r; // Height of each rectangle

  // Loop through each cell in the grid
  for (let i = 0; i < c; i++) {
    for (let j = 0; j < r; j++) {
      // Calculate the x and y position
      let x = i * w;
      let y = j * h;

      // Create a glitch effect by using random values
      let glitchFactor = random(0.5, 3); // Random factor for size
      let colorValue = map(sin(frameCount * 0.8 + (i + j)), -1, 1, 0, 200); // Color based on sine wave

      // Set fill color with a glitchy effect
      fill(colorValue, 10, 20, 50); // Semi-transparent color

      // Draw the rectangle with a glitchy size
      rect(x, y, w * glitchFactor, h * glitchFactor);
      ellipse(x, y, w * glitchFactor, h * glitchFactor);
    }
  }
}