import processing.serial.*;

Serial myPort; // Serial connection to Arduino
float potValue = 0; // Potentiometer value

void setup() {
  fullScreen(); // Fullscreen mode
  myPort = new Serial(this, "COM3", 9600); // Connect to Arduino on COM3
  myPort.bufferUntil('\n'); // Read until newline character
  background(0); // Set background to black
}

void serialEvent(Serial myPort) {
  String val = myPort.readStringUntil('\n'); // Read data from serial
  if (val != null) {
    val = trim(val); // Trim whitespace
    if (val.length() > 0) {
      potValue = float(val); // Convert potentiometer value to float
    }
  }
}

void draw() {
  // Map potValue to determine whether it's day or night
  float skyColor = map(potValue, 0, 1023, 50, 255); // Map potentiometer to sky color
  
  if (skyColor > 150) {
    // Daytime View
    background(255); // White sky
    fill(255, 204, 0); // Yellow sun
    ellipse(width / 4, height / 4, 150, 150); // Sun position and size

    // Draw the ground
    fill(34, 139, 34); // Green color for the ground
    noStroke();
    rect(0, height - 100, width, 100); // Ground at the bottom
    
    
  } else {
    // Nighttime View
    background(25, 25, 112); // Dark blue sky
    
    // Draw stars
    for (int i = 0; i < 100; i++) {
      float starX = random(width); // Random x-coordinate
      float starY = random(height - 100); // Random y-coordinate, avoiding the ground
      fill(255); // White stars
      noStroke();
      ellipse(starX, starY, 5, 5); // Star size
    }

    // Draw the moon
    fill(255); // White moon
    ellipse(width / 4, height / 4, 150, 150); // Moon position and size

    // Draw the ground
    fill(34, 139, 34); // Green color for the ground
    noStroke();
    rect(0, height - 100, width, 100); // Ground at the bottom

  
  }
}
