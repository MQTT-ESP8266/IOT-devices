#include <QueueArray.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// Blindscontrol

const char* ssid = "ssid";
const char* password = "password";
const char* mqtt_server = "mqtt-hostname";

WiFiClient espClient;
PubSubClient client(espClient);

int pwrstatus = 0;
int switchstate = 0;
int relaypin = 14;
const int buttonPin = 16;
const int ledPin =  13;
int buttonState = 0; 
int buttonevent = 0;
unsigned long buttonpressrelease = 0;
/*
int delaytime = 50;
int bptime = 350; //Button Press Time
int brtime = 200;  //Button Release Time
int blindnext = 5;
int blindprevious = 13;
int blindup = 12;
int blindstop = 14;
int blinddown = 16;
byte condition = 0;
QueueArray <int> queue;
int blind;
int action;
long timer = 0;
long timer2 = 0;
int x = 1;
*/

void setup_wifi() {
  delay(10); // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}


void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
  /*
  byte blindrd;
  byte actionrd;
  blindrd = (char)payload[0]-'0';
  actionrd = (char)payload[1]-'0';
  queue.enqueue(blindrd);Serial.print("Enqueue ");Serial.println(blindrd);
  queue.enqueue(actionrd);Serial.print("Enqueue ");Serial.println(actionrd);
  */
  if (((char)payload[0]-'0') == 1) {
      if (pwrstatus == 0) {
        pwrstatus = 1;
        switchstate = 1;
      }
  }
  if (((char)payload[0]-'0') == 0) {
      if (pwrstatus == 1) {
        pwrstatus = 0;
        switchstate = 1;
      }
  }
}


void setup() {
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  pinMode(relaypin, OUTPUT);
  digitalWrite(relaypin, HIGH);
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect("Client_powerplugx")) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      client.publish("outTopic", "hello world");
      // ... and resubscribe
      client.subscribe("powerplug1");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}


void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  buttonState = digitalRead(buttonPin);

  if ((switchstate == 1) && (pwrstatus == 0)) {
    digitalWrite(relaypin, HIGH);
    digitalWrite(ledPin, LOW);
    switchstate = 0;
    Serial.println("switched off");
    client.publish("powerplugs", "Powerplug1 - OFF");
  }
  if ((switchstate == 1) && (pwrstatus == 1)) {
    digitalWrite(relaypin, LOW);
    digitalWrite(ledPin, HIGH);
    switchstate = 0;
    Serial.println("switched on");
    client.publish("powerplugs", "Powerplug1 - ON");
  }
  if ((buttonState == HIGH) && (switchstate == 0) && (buttonevent==0)) {
    if (pwrstatus == 0) {
      pwrstatus = 1;     
      }
    else {
      pwrstatus = 0;
      }
    switchstate = 1;
    buttonevent = 1;
    buttonpressrelease=millis();
  }
  if ((buttonState == LOW) && (buttonevent == 1) && (millis()>(buttonpressrelease+200))) {
    buttonevent=0;
  }
  

  //delay(1000);
  //Serial.print("millis: ");Serial.println(millis());
}

