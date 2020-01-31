
/*  29-01-2020
 *  Advanced Wearables Assignment 1 : Textile Interface Project
 *  Project Name: E-yoga mat
 *  by Priya Bandodkar
 */
 
#include <AP_Sync.h>
#include <Adafruit_CircuitPlayground.h>

#define CAP_THRESHOLD 250
#define DEBOUNCE 100

AP_Sync sendData(Serial);

// Declare sensor pin numbers
int analogPin1 = 0;
int capacitivePin1R = 10; // Right Hand
int capacitivePin1L = 3; // Left Hand
int capacitivePin2R = 9; // Right Foot
int capacitivePin2L = 2; // Left Foot

// Declare variables to store sensor inputs
int analogVal1;
int capacitiveVal1R;
int capacitiveVal1L;
int capacitiveVal2R;
int capacitiveVal2L;

void setup() {
  Serial.begin(9600);   // Initialize serial
  CircuitPlayground.begin();  // Initialize Circuit Playground library
}

void loop() {
  // Read inputs from Sensors
  analogVal1 = analogRead(analogPin1);
  capacitiveVal1R = CircuitPlayground.readCap(capacitivePin1R);
  capacitiveVal1L = CircuitPlayground.readCap(capacitivePin1L);
  capacitiveVal2R = CircuitPlayground.readCap(capacitivePin2R);
  capacitiveVal2L = CircuitPlayground.readCap(capacitivePin2L);

  delay(100); // Update rate

  // Send readings to processing
  sendData.sync("Asensor1",analogVal1);
  sendData.sync("Csensor1R",capacitiveVal1R);
  sendData.sync("Csensor1L",capacitiveVal1L);
  sendData.sync("Csensor2R",capacitiveVal2R);
  sendData.sync("Csensor2L",capacitiveVal2L);
  
}
