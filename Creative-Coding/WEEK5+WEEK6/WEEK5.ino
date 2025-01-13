#define BUTTON_1 2
#define BUTTON_2 3
#define BUTTON_3 4
#define BUTTON_4 5
#define BUTTON_5 6
#define BUTTON_6 7
#define BUTTON_7 8
#define BUTTON_8 9

void setup() {
  Serial.begin(9600); // Start serial communication
  pinMode(BUTTON_1, INPUT_PULLUP);
  pinMode(BUTTON_2, INPUT_PULLUP);
  pinMode(BUTTON_3, INPUT_PULLUP);
  pinMode(BUTTON_4, INPUT_PULLUP);
  pinMode(BUTTON_5, INPUT_PULLUP);
  pinMode(BUTTON_6, INPUT_PULLUP);
  pinMode(BUTTON_7, INPUT_PULLUP);
  pinMode(BUTTON_8, INPUT_PULLUP);
}

void loop() {
  if (digitalRead(BUTTON_1) == HIGH) Serial.println("A");
  else if (digitalRead(BUTTON_2) == HIGH) Serial.println("B");
  else if (digitalRead(BUTTON_3) == HIGH) Serial.println("C");
  else if (digitalRead(BUTTON_4) == HIGH) Serial.println("D");
  else if (digitalRead(BUTTON_5) == HIGH) Serial.println("E");
  else if (digitalRead(BUTTON_6) == HIGH) Serial.println("F");
  else if (digitalRead(BUTTON_7) == HIGH) Serial.println("G");
  else if (digitalRead(BUTTON_8) == HIGH) Serial.println("H");

  delay(100); // Add a small delay to avoid flooding the serial output
}
