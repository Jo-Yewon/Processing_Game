const int SOUND_SENSOR_PIN = A0;
int sensorValue;
 
void setup() {
  Serial.begin(9600);
  pinMode(SOUND_SENSOR_PIN, INPUT);
}
 
void loop() {
  sensorValue = analogRead(SOUND_SENSOR_PIN);
  Serial.println(sensorValue);
  delay(20);
}
