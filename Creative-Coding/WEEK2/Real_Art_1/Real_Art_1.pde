ArrayList<Leaf> leaves = new ArrayList<Leaf>();
ArrayList<Tree> trees = new ArrayList<Tree>();

boolean isAutumn = false; // Toggle for seasonal colors

void setup() {
  size(800, 600);
}

void draw() {
  // Background color changes with seasons
  background(isAutumn ? color(255, 200, 100) : color(150, 220, 150));
  
  // Draw ground
  fill(120, 100, 70);
  rect(0, height - 50, width, 50);
  
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
  
  // Instructions
  fill(0);
  textAlign(CENTER);
  text("Move mouse to grow trees, click to make leaves fall. Press 'S' for seasons.", width / 2, 20);
}

// Add trees when mouse moves
void mouseMoved() {
  if (frameCount % 5 == 0) {
    trees.add(new Tree(mouseX, height - 100, random(30, 50)));
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

// Tree class
class Tree {
  float x, y, size;

  Tree(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    // Draw trunk
    fill(120, 100, 70);
    rect(x - size / 10, y, size / 5, -size);

    // Draw leaves
    fill(isAutumn ? color(255, 150, 50) : color(50, 200, 50));
    ellipse(x, y - size, size, size);
  }

  void releaseLeaves() {
    for (int i = 0; i < 5; i++) {
      leaves.add(new Leaf(x + random(-size / 2, size / 2), y - size));
    }
  }
}

// Leaf class
class Leaf {
  float x, y, size, speed;
  color c;

  Leaf(float x, float y) {
    this.x = x;
    this.y = y;
    this.size = random(5, 10);
    this.speed = random(1, 3);
    this.c = isAutumn ? color(255, 150, 50) : color(50, 200, 50);
  }

  void update() {
    y += speed; // Fall down
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
