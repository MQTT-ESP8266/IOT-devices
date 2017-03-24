#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <MQTTClient.h>

#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>

#define DHTPIN            14         // Pin which is connected to the DHT sensor.
#define DHTTYPE           DHT22     // DHT 22 (AM2302)
#define FORCE_DEEPSLEEP

DHT_Unified dht(DHTPIN, DHTTYPE);
uint32_t delayMS;


const char* ssid = "ssid";
const char* password = "password";
const char* host = "mqtt-hostname";

WiFiClient net;
MQTTClient mqtt;
void connect();

// Time to sleep (in seconds):
const int sleepTimeS = 600;
int attinystate = 0;
int pirstate = 0;
unsigned int lightlv = 0;
int lightlvpower = 13;
int dhtpower = 15;
unsigned long dhtreadytime = 5000;
unsigned long runtime = 0;

void setup() 
{
  Serial.begin(115200);
  pinMode(dhtpower, OUTPUT);
  digitalWrite(dhtpower, HIGH);  
  dht.begin();
  
  //dhtreadytime = dhtreadytime + millis();
  pinMode(4, INPUT);  //Sense PIR Indicator from ATTINY
  pinMode(A0, INPUT);
  pirstate = digitalRead(4);
  pinMode(lightlvpower, OUTPUT);
  digitalWrite(lightlvpower, HIGH); 
  setup_wifi();
  //client.setServer(mqtt_server, 1883);
  //client.setCallback(callback);
  mqtt.begin("192.168.0.11", net);
  if (!mqtt.connected()) {
    connect();
  }
  mqtt.loop();


  // Movement
  //
  Serial.println("Reason for Restart:");
  if (pirstate == HIGH) {
    Serial.println("Movement Detected");
    Serial.println("");
    mqtt.publish("/stairs/movement","1");
    //delay(dhtreadytime);
    //mqtt.publish("/stairs/movement","0");
  } else {
    Serial.println("Timed Restart");
    Serial.println("");
    //if (dhtreadytime > millis()) {
    //  delay(dhtreadytime-millis());
    //}
  }

//  while (millis() < 1100) {
//    delay(50);
//  }

unsigned long counter = millis()+3000;
  while (true) {  
 
  // Temperature & Humidity
  //
  sensors_event_t event;  
  dht.temperature().getEvent(&event);
  if (isnan(event.temperature)) {
    Serial.println("Error reading temperature!");
  }
  else {
    Serial.print("Temperature: ");
    Serial.print(event.temperature);
    mqtt.publish("/stairs/temperature",String(event.temperature));
    Serial.println(" *C");
  }
  // Get humidity event and print its value.
  dht.humidity().getEvent(&event);
  if (isnan(event.relative_humidity)) {
    Serial.println("Error reading humidity!");
  }
  else {
    Serial.print("Humidity: ");
    Serial.print(event.relative_humidity);
    mqtt.publish("/stairs/humidity",String(event.relative_humidity));
    Serial.println("%");
    break;
  }
  if (counter < millis()) {
    break;
  }
  }


  // Lightlevel
  //
  Serial.print("Lightlevel: ");
  lightlv = analogRead(A0);
  Serial.println(lightlv);
  mqtt.publish("/stairs/lightlevel",String(lightlv));

  runtime = millis();
  Serial.print("Runtime: ");
  Serial.println(runtime);
  mqtt.publish("/stairs/runtime",String(runtime));
  
  /*
  Serial.println("Deepsleep in...");
  for (int i=10;i>0;i--) {
    Serial.println(i);
    delay(1000);
  }
  */
  Serial.println("Turning off power for Light meter");
  digitalWrite(lightlvpower, HIGH);
  Serial.println("Turning off power for DHT");
  digitalWrite(dhtpower, HIGH);
  Serial.println("Going to deepsleep");
  // deepSleep time is defined in microseconds. Multiply
  // seconds by 1e6 
  //delay(10);
  ESP.deepSleep(sleepTimeS * 1000000); 
}


void setup_wifi() {
  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  //static IP
  WiFi.config(IPAddress(192,168,0,19), IPAddress(192,168,0,1), IPAddress(255,255,255,0), IPAddress(192,168,0,1));
  
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(50);
    Serial.print(".");
  }

  randomSeed(micros());
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}


void callback(char* topic, byte* payload, unsigned int length) {
  /* 
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();

  // Switch on the LED if an 1 was received as first character
  if ((char)payload[0] == '1') {
    digitalWrite(BUILTIN_LED, LOW);   // Turn the LED on (Note that LOW is the voltage level
    // but actually the LED is on; this is because
    // it is acive low on the ESP-01)
  } else {
    digitalWrite(BUILTIN_LED, HIGH);  // Turn the LED off by making the voltage HIGH
  }
  */
}


void connect() {
  while(WiFi.waitForConnectResult() != WL_CONNECTED){
    WiFi.begin(ssid, password);
    Serial.println("WiFi failed, retrying.");
  }
 
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
 
  while (!mqtt.connect(host, "shiftr-thing", "shiftr-pass")) {
    Serial.print(".");
  }
  Serial.println("\nconnected!");
}
 
 
void messageReceived(String topic, String payload, char * bytes, unsigned int length) {
  Serial.print("incoming: ");
  Serial.print(topic);
  Serial.print(" - ");
  Serial.print(payload);
  Serial.println();
}
 
double mapDouble(double x, double in_min, double in_max, double out_min, double out_max)
{
  double temp = (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
  temp = (int) (4*temp + .5);
  return (double) temp/4;
}


void loop() 
{
}


