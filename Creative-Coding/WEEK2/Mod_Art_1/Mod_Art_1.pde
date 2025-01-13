ArrayList<Leaf> leaves = new ArrayList<Leaf>();
ArrayList<Tree> trees = new ArrayList<Tree>();
ArrayList<Bird> birds = new ArrayList<Bird>();
float windSpeed; 
boolean isAutumn = false; // Toggle for seasonal colors

void setup() {
fullScreen();
windSpeed = 0;
for (int i = 0; i < 5; i++) {
    birds.add(new Bird(random(width), random(height / 2))); // Birds start in the upper half
  }
}

void draw() {
  // Background color changes with seasons
  background(isAutumn ? color(255, 200, 100) : color(150, 220, 150));
  // Simulate wind effect
  windSpeed = sin(frameCount * 0.01) * 3; // Oscillating wind effect
  // Draw ground
  fill(120, 100, 70);
  rect(0, height - 150, width, 150);
  
  // Draw all trees
  for (Tree tree : trees) {
    tree.display();
  }
  
  // Update and draw leaves
  for (int i = leaves.size() - 1; i >= 0; i--) {
    Leaf leaf = leaves.get(i);
    leaf.update();
    leaf.display();
    if (leaf.offScreen()) {
      leaves.remove(i);
    }
  }
  // Draw and update birds
  for (Bird b : birds) {
    b.update();
    b.display();
  }


  // Instructions
  //fill(0);
  //textAlign(CENTER);
  //textSize(35);
  //text("Move mouse to grow trees, click to make leaves fall. Press 'S' for seasons.", width / 2, 40);
}

// Add trees when mouse moves
void mouseMoved() {
  if (frameCount % 7 == 0) {
    trees.add(new Tree(mouseX, height - 100, random(30, 350)));
  }
}

// Add leaves to fall on click
void mousePressed() {
  for (Tree tree : trees) {
    tree.releaseLeaves();
  }
}

// Toggle seasons with 'S'
void keyPressed() {
  if (key == 'S' || key == 's') {
    isAutumn = !isAutumn;
  }
}
// Bird class
class Bird {
  float x, y, speedX;

  Bird(float x, float y) {
    this.x = x;
    this.y = y;
    this.speedX = random(2, 4); // Flying speed
  }
void update() {
    x += speedX; // Move right
    if (x > width) {
      x = -20; // Wrap around to the left side
      y = random(height / 2); // Randomize height
    }
  }

  void display() {
    fill(0); // Black bird
    noStroke();
    triangle(x, y, x - 10, y + 5, x - 1, y - 5); // Simple triangle as a bird
  }
}
// Tree class
class Tree {
  float x, y, size;
  float swayOffset; 
  Tree(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.swayOffset = random(TWO_PI); 
  }
void update() {
    x += sin(frameCount * 0.01 + swayOffset) * 0.5; // Horizontal swaying effect
  }
  void display() {
    // Draw trunk
    fill(120, 100, 70);
    rect(x - size / 10, y, size / 5, -size);
    float sway = sin(frameCount * 0.05 + swayOffset) * 10; // Swaying motion
    // Draw leaves
    fill(isAutumn ? color(255, 150, 50) : color(50, 200, 50));
    ellipse(x + sway, y - size, size, size);
  }

  void releaseLeaves() {
    for (int i = 0; i < 5; i++) {
      leaves.add(new Leaf(x + random(-size / 2, size / 2), y - size));
    }
  }
}

// Leaf class
class Leaf {
  float x, y, size, speedY, speedX;
  color c;

  Leaf(float x, float y) {
    this.x = x + random(-30, 30);
    this.y = y - 100;
    this.speedY = random(1, 3); // Falling speed
    this.speedX = random(-2, 2); // Initial wind effect
    this.size = random(5, 10);
    this.c = isAutumn ? color(255, 150, 50) : color(50, 200, 50);
  }

  void update() {
    y += speedY; // Falling down
    x += speedX + windSpeed * 0.2;; // Horizontal movement (wind)

    // Simulate a dynamic wind effect
    if (frameCount % 60 == 0) { // Change wind direction every second
      speedX += random(-0.5, 0.5);
      speedX = constrain(speedX, -3, 3); // Limit the wind speed
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, size, size);
  }

  boolean offScreen() {
    return y > height;
  }
}
