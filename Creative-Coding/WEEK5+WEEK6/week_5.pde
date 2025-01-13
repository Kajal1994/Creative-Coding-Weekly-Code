import processing.serial.*;
import ddf.minim.*; // Import Minim library for sound
import java.util.ArrayList; // For managing multiple letters in the background

Serial myPort; // Create a Serial object
String receivedData = ""; // Store the received letter
Minim minim; // Minim object for sound
AudioPlayer soundA, soundB, soundC, soundD, soundE, soundF, soundG, soundH; // Audio players for each sound
color randomColor; // Variable to store random color for each letter
ArrayList<BackgroundLetter> letters = new ArrayList<BackgroundLetter>(); // Store letters in background
boolean buttonPressed = false; // Flag to track if a button has been pressed

void setup() {
  fullScreen(); // Set the size of the window to fullscreen
  myPort = new Serial(this, "COM3", 9600); // Connect to the Arduino's serial port
  myPort.clear(); // Clear any existing data in the serial buffer
  delay(2); // Allow time for the Arduino to reset
  myPort.readStringUntil('\n'); // Flush any initial data from the serial buffer

  textSize(120); // Set the text size
  textAlign(CENTER, CENTER); // Center the text
  minim = new Minim(this); // Initialize Minim

  // Load sound files for each button
  soundA = minim.loadFile("A.wav");
  soundB = minim.loadFile("B.wav");
  soundC = minim.loadFile("C.wav");
  soundD = minim.loadFile("D.wav");
  soundE = minim.loadFile("E.wav");
  soundF = minim.loadFile("F.wav");
  soundG = minim.loadFile("G.wav");
  soundH = minim.loadFile("H.wav");

  randomColor = color(random(255), random(255), random(255)); // Initialize with a random color
}

void draw() {
  background(0); // Set background color to black

  // Update and draw background letters
  for (int i = letters.size() - 1; i >= 0; i--) {
    BackgroundLetter letter = letters.get(i);
    letter.update();
    letter.display();
    if (letter.isFinished()) {
      letters.remove(i); // Remove the letter when it has fully faded
    }
  }

  // Display the main instruction text if no button has been pressed yet
  if (!buttonPressed) {
    fill(255); // White color for "Press a Button" text
    text("Press a Button", width / 2, height / 3); // Instruction text
  }

  // Display the pressed letter
  if (receivedData != null && receivedData.length() > 0) {
    fill(randomColor); // Set text color
    text("You pressed: " + receivedData, width / 2, height / 2); // Display the received letter
  }
}

void serialEvent(Serial myPort) {
  receivedData = myPort.readStringUntil('\n'); // Read data from Arduino
  if (receivedData != null) {
    receivedData = receivedData.trim(); // Remove any extra whitespace
    buttonPressed = true; // Mark that a button has been pressed
    playSound(receivedData); // Play corresponding sound
    randomColor = color(random(255), random(255), random(255)); // Change to a new random color

    // Add multiple background letters
    for (int i = 0; i < 10; i++) { // Add 10 letters for each button press
      letters.add(new BackgroundLetter(receivedData, random(width), random(height)));
    }
  }
}

void playSound(String letter) {
  // Ensure only the correct sound plays
  if (letter.equals("A")) { soundA.rewind(); soundA.play(); }
  else if (letter.equals("B")) { soundB.rewind(); soundB.play(); }
  else if (letter.equals("C")) { soundC.rewind(); soundC.play(); }
  else if (letter.equals("D")) { soundD.rewind(); soundD.play(); }
  else if (letter.equals("E")) { soundE.rewind(); soundE.play(); }
  else if (letter.equals("F")) { soundF.rewind(); soundF.play(); }
  else if (letter.equals("G")) { soundG.rewind(); soundG.play(); }
  else if (letter.equals("H")) { soundH.rewind(); soundH.play(); }
}

// Class to handle background letters
class BackgroundLetter {
  String letter;
  float x, y; // Position
  float alpha; // Transparency

  BackgroundLetter(String letter, float x, float y) {
    this.letter = letter;
    this.x = x;
    this.y = y;
    this.alpha = 255; // Start fully opaque
  }

  void update() {
    alpha -= 5; // Reduce transparency over time
  }

  void display() {
    fill(random(255), random(255), random(255), alpha); // Random color with transparency
    textSize(120); // Set text size for background letters
    textAlign(CENTER, CENTER); // Center-align text
    text(letter, x, y); // Draw the letter at its position
  }

  boolean isFinished() {
    return alpha <= 0; // Check if the letter is fully transparent
  }
}
