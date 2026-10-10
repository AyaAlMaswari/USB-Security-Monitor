#define GREEN_LED 18
#define RED_LED 19

void setup() {
  Serial.begin(115200);

  pinMode(GREEN_LED, OUTPUT);
  pinMode(RED_LED, OUTPUT);

  digitalWrite(GREEN_LED, LOW);
  digitalWrite(RED_LED, LOW);

  Serial.println("USB SECURITY SYSTEM READY");
}

void loop() {
  if (Serial.available() > 0) {

    String command = Serial.readStringUntil('\n');
    command.trim();

    if (command == "TRUSTED") {
      digitalWrite(GREEN_LED, HIGH);
      digitalWrite(RED_LED, LOW);

      Serial.println("ACCESS ALLOWED");
    }

    else if (command == "ALERT") {
      digitalWrite(GREEN_LED, LOW);
      digitalWrite(RED_LED, HIGH);

      Serial.println("UNKNOWN USB DETECTED");
    }

    else if (command == "OFF") {
      digitalWrite(GREEN_LED, LOW);
      digitalWrite(RED_LED, LOW);

      Serial.println("SYSTEM IDLE");
    }
  }
}