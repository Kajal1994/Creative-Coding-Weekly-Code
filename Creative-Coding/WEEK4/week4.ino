int notes[] = {262, 294, 330, 349};

void setup() {
  Serial.begin(9600);
}

void playMelody() {
  int melody[] = {262, 294, 330, 349}; // Melody notes
  int duration = 300;                 // Duration for each note in milliseconds

  for (int i = 0; i < 4; i++) {
    tone(8, melody[i]); // Play each note
    delay(duration);    // Hold note for the duration
  }
  noTone(8); // Stop the tone after the melody
}

void loop() {
  int keyVal = analogRead(A0);
  Serial.println(keyVal);

  if (keyVal == 1023) {
    tone(8, notes[0]); // Play individual tone
  } 
  else if (keyVal >= 990 && keyVal <= 1010) {
    tone(8, notes[1]); // Play individual tone
  }
  else if (keyVal >= 505 && keyVal <= 515) {
    playMelody(); // Play the melody when this range is detected
  }
  else if (keyVal >= 5 && keyVal <= 10) {
    tone(8, notes[3]); // Play individual tone
  }
  else {
    noTone(8); // Stop tone
  }
}
