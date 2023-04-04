#include <FirebaseESP8266.h>
#include <ArduinoOTA.h>
#include <ESP8266WiFi.h>
#include<WiFiManager.h>
#include <NewPing.h>
#define URL "https://smatsustainsolution-default-rtdb.firebaseio.com/"
#define KEY "oR6V7PsgpHyNhRBLt7hKexH8bh6MU2AYKpKrnw58"
#define TRIGGER_PIN  14 
#define ECHO_PIN     12 
#define MAX_DISTANCE 127 


NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.



FirebaseData firebaseData;
WiFiManager wifimanager;

int sensorPin = 5;
volatile long pulse;
unsigned long lastTime;
float volume;
float Litter=0;
int discard_valve=4;
int recyle_valve=0;
long distanceIn_cm;  
int distanceInch;  
int Percentage;
int Filled_percentage;
int Emptyness;
int overflow_pin=10;
int water_present=13;
int water_going_side;
int recycle_motor=9;
bool one_time_open=true;
bool overflo=false;


int ultra()
{
  delay(50);unsigned int uS = sonar.ping(); 

  
  distanceIn_cm=sonar.convert_cm(uS);
  
  distanceInch = distanceIn_cm/2.54;Emptyness=distanceInch;
  
  Percentage=(Emptyness*100)/5;Filled_percentage=100-Percentage;
  
  return Filled_percentage;
}




void connectToWiFi() {

Serial.println("Connecting");
wifimanager.autoConnect("Home Setup");
Serial.println("Connected");


  Firebase.begin(URL, KEY);
}


void Discard_valve_open()
{
  
  Serial.println("Discard Water");
  digitalWrite(discard_valve,LOW);
}

void Discard_valve_close()
{
  digitalWrite(discard_valve,HIGH);
}



void recyle_valve_open()
{ 
  Serial.println("Water Clean");
  digitalWrite(recyle_valve,LOW);
  digitalWrite(recycle_motor,LOW);
  
}

void recyle_valve_close()
{
  digitalWrite(recyle_valve,HIGH);
   digitalWrite(recycle_motor,HIGH);
}

void setup() {
 
  Serial.begin(9600);
pinMode(sensorPin, INPUT);
pinMode(overflow_pin,INPUT_PULLUP);

pinMode(discard_valve,OUTPUT);
digitalWrite(discard_valve,HIGH);

pinMode(recyle_valve,OUTPUT);
digitalWrite(recyle_valve,HIGH);

pinMode(water_present,INPUT_PULLUP);

pinMode(recycle_motor,OUTPUT);
digitalWrite(recycle_motor,HIGH);




  attachInterrupt(digitalPinToInterrupt(sensorPin), increase, RISING);
  connectToWiFi();
 
}


void loop() {

Serial.println(digitalRead(water_present));
  
  if(one_time_open==true && overflo==false)
  {

    if (digitalRead(water_present)== 0 )
  {
  Serial.println("Water Present ");
  
     int sensorValue = analogRead(0);
  Serial.println("---------------");
  Serial.println(sensorValue);
  Serial.println("---------------");
  

    if(sensorValue<220){
    Discard_valve_open();
    recyle_valve_close();
    water_going_side=1;
    //water dirty
  }
  else if (sensorValue> 220){
    recyle_valve_open();
    Discard_valve_close();
    water_going_side=0;
    //water clean
  }
  }
   else{
    water_going_side=2;
    recyle_valve_close();
    Discard_valve_close();
  }

    
  }
 
  volume = 2.663 * pulse;
  Litter=volume/1000;


  Serial.print(Litter);
  Serial.println(" L");


  Serial.println(ultra());
  

     if ( digitalRead(overflow_pin)==0 && digitalRead(water_present)== 0 && one_time_open==true)
     {
      Serial.println("--WATER OVERFLOW--");
      Discard_valve_open();
      water_going_side=1;
      recyle_valve_close();////open discard
      overflo=true;
     }

     
     else if (digitalRead(overflow_pin)== 1 && digitalRead(water_present)== 1   && one_time_open==true)
     {
      recyle_valve_close();
      Discard_valve_close();
      water_going_side=2;
      overflo=false;
     }

  else {
    Serial.println("Failed to get data from Firebase");
  }

      
  delay(500);        // delay in between reads for stability
}

ICACHE_RAM_ATTR void increase() {
  pulse++;
}
