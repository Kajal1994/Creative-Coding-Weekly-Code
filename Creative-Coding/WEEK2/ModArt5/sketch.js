let words = ["Life", "Is", "So", "Beautiful"]; // Array of words
let textObjects = []; // Array to store moving text objects

function setup() {
  createCanvas(windowWidth, windowHeight); // Full-screen canvas
  background(0); // Black background

  // Create text objects with random positions and speeds
  for (let i = 0; i < words.length; i++) {
    let x = random(width);
    let y = random(height);
    let speedX = random(-2, 2); // Horizontal speed
    let speedY = random(-2, 2); // Vertical speed
    let size = random(30, 80); // Text size
    let col = color(random(255), random(255), random(255)); // Random color
    textObjects.push(new MovingText(words[i], x, y, speedX, speedY, size, col));
  }
}

function draw() {
  background(0, 50); // Slightly fade the background for trails

  // Display and update all text objects
  for (let i = 0; i < textObjects.length; i++) {
    textObjects[i].move();
    textObjects[i].display();
  }
}
function keyTyped() {
  let col = color(random(255), random(255), random(255));
  textObjects.push(new MovingText(key, random(width), random(height), random(-2, 2), random(-2, 2), random(30, 80), col));
}

// MovingText class for dynamic text
class MovingText {
  constructor(word, x, y, speedX, speedY, size, col) {
    this.word = word; // Text to display
    this.x = x;
    this.y = y;
    this.speedX = speedX; // Horizontal speed
    this.speedY = speedY; // Vertical speed
    this.size = size; // Text size
    this.col = col; // Text color
    this.alpha = 255;
  }

  // Move the text and make it bounce off walls
  move() {
    this.x += this.speedX;
    this.y += this.speedY;

    if (this.x < 0 || this.x > width) {
      this.speedX *= -1; // Bounce horizontally
    }
    if (this.y < 0 || this.y > height) {
      this.speedY *= -1; // Bounce vertically
    }
  }

  // Display the text
  display() {
    this.size = this.size + sin(frameCount * 0.05) * 2;
    this.alpha -= 2; // Slowly fade out
    this.alpha = max(this.alpha, 0); // Ensure alpha doesn't go below 0

    fill(this.col.levels[0], this.col.levels[1], this.col.levels[2], this.alpha); // Set text color
    textSize(this.size); // Set text size
    textAlign(CENTER, CENTER);
    text(this.word, this.x, this.y);
  }
}
