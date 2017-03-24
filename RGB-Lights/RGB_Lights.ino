#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// Blindscontrol

const char* ssid = "ssid";
const char* password = "password";
const char* mqtt_server = "hostname";

WiFiClient espClient;
PubSubClient client(espClient);


byte red = 12;
byte green = 13;
byte blue = 14;
int color[]={0,0,0,0};
byte active = 0;
unsigned int long timeoff = 0;

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
  color[0]=0;color[1]=0;color[2]=0;color[3]=0;
  int colvar = 0;
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");

  for (int i = 0; i < length; i++) {
    if (payload[i] == 35) {
      colvar++ ;
      i++; 
    }
    
    color[colvar] = (payload[i]-48) + color[colvar]*10;
    Serial.print((char)payload[i]);
  }
  Serial.println();
  Serial.print("Das magische R: ");Serial.println(color[0]);
  Serial.print("Das magische G: ");Serial.println(color[1]);
  Serial.print("Das magische B: ");Serial.println(color[2]);
  Serial.print("Timeoff: ");Serial.println(color[3]);
  if (color[3]>0) {
    timeoff = millis()+(color[3]*1000);
    active = 2;
  }
  else {
    active = 1;
  }
}


void setup() {
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect("RGBLightStairs")) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      client.publish("outTopic", "hello world");
      // ... and resubscribe
      client.subscribe("rgbstairs");
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

  if (active == 1) {
    analogWrite(red,color[0]);
    analogWrite(green,color[1]);
    analogWrite(blue,color[2]);
  }
  if (active == 2) {
    if (millis()>timeoff) {
      analogWrite(red,0);
      analogWrite(green,0);
      analogWrite(blue,0);
      active = 0;
    }
    else {
      analogWrite(red,color[0]);
      analogWrite(green,color[1]);
      analogWrite(blue,color[2]);
    }
  }
  

}

