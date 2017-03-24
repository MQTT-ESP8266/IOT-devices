#include <QueueArray.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// Blindscontrol

const char* ssid = "SSID";
const char* password = "password";
const char* mqtt_server = "mqtt-hostname";

WiFiClient espClient;
PubSubClient client(espClient);

int pwrstatus = 0;
//int switchstate = 0;
//int relaypin = 14;

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
  
  byte blindrd;
  byte actionrd;
  blindrd = (char)payload[0]-'0';
  actionrd = (char)payload[1]-'0';
  queue.enqueue(blindrd);Serial.print("Enqueue ");Serial.println(blindrd);
  queue.enqueue(actionrd);Serial.print("Enqueue ");Serial.println(actionrd);

  /*
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
  */
}


void setup() {
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  //pinMode(relaypin, OUTPUT);
  //digitalWrite(relaypin, LOW);
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect("Client_powerplug1")) {
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


  if (condition==0) {
    if (!queue.isEmpty()) {
      condition=1;
    }
  }

  if (condition==1)  {
    blind = queue.dequeue(); Serial.print("Dequeue ");Serial.print(blind);
    condition=2;
  }

  if (condition==2)  {
    action = queue.dequeue(); Serial.print(" ");Serial.println(action);
    condition=3;
  }

  if (condition==3)  {
    if (x<blind) {
      if ((timer == 0) && (timer2 == 0)) {
        timer = millis()+delaytime;
        digitalWrite(blindnext,HIGH); Serial.println("blindnext,high");
      } 
      if ((timer>0)&&(timer<millis())) {
        digitalWrite(blindnext,LOW); Serial.println("blindnext,low"); 
        timer = 0;
        timer2 = millis()+delaytime;
      }
      if ((timer2 > 0) && (timer2<millis())) {
        x++;
        timer = 0;
        timer2 = 0;
      }
    }
    else {
      condition = 4;
      x = 1;
    }
    
  }

  if (condition==4) {
    if (action == 0)  {
      if ((timer == 0) && (timer2 == 0)) {
        timer = millis()+bptime;
        digitalWrite(blinddown,HIGH); Serial.println("blinddown,high");
      }
      if ((timer>0)&&(timer<millis())) {
        digitalWrite(blinddown,LOW); Serial.println("blinddown,low"); 
        timer = 0;
        timer2 = millis()+brtime;
      } 
      if ((timer2 > 0) && (timer2<millis())) {
        condition = 5;
        timer2 = 0;        
      }
    }
    if (action == 1)  {
      if ((timer == 0) && (timer2 == 0)) {
        timer = millis()+bptime;
        digitalWrite(blindup,HIGH); Serial.println("blindup,high");
      }
      if ((timer>0)&&(timer<millis())) {
        digitalWrite(blindup,LOW); Serial.println("blindup,low"); 
        timer = 0;
        timer2 = millis()+brtime;
      } 
      if ((timer2 > 0) && (timer2<millis())) {
        condition = 5; 
        timer2 = 0;       
      }
    }
    if (action == 2)  {
      if ((timer == 0) && (timer2 == 0)) {
        timer = millis()+bptime;
        digitalWrite(blindstop,HIGH); Serial.println("blindstop,high");
      }
      if ((timer>0)&&(timer<millis())) {
        digitalWrite(blindstop,LOW); Serial.println("blindstop,low"); 
        timer = 0;
        timer2 = millis()+brtime;
      } 
      if ((timer2 > 0) && (timer2<millis())) {
        condition = 5; 
        timer2 = 0;       
      }
    }
  }

  if (condition==5)  {
    if (x<blind) {
      if ((timer == 0) && (timer2 == 0)) {
        timer = millis()+delaytime;
        digitalWrite(blindprevious,HIGH); Serial.println("blindprevious,high");
      } 
      if ((timer>0)&&(timer<millis())) {
        digitalWrite(blindprevious,LOW); Serial.println("blindprevious,low"); 
        timer = 0;
        timer2 = millis()+delaytime;
      }
      if ((timer2 > 0) && (timer2<millis())) {
        x++;
        timer = 0;
        timer2 = 0;
      }
    }
    else {
      condition = 0;
      x = 1;
    }
   
  }
  

  //delay(1000);
  //Serial.print("millis: ");Serial.println(millis());
}

