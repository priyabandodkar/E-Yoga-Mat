

import processing.serial.*; // import the Processing serial library
import apsync.*;

public float Asensor1;
public float Csensor1R;
public float Csensor1L;
public float Csensor2R;
public float Csensor2L;

AP_Sync readVals;

PImage Title;
PImage PoseSit1;
PImage PoseSit2;
PImage PoseHR;
PImage PoseHL;
PImage PoseFR;
PImage PoseFL;
PImage PoseHBoth;
PImage PoseFBoth;
PImage PoseHLFL;

void setup(){
  fullScreen();
  //size(500,500);
  
  printArray(Serial.list());
  String serialPort = Serial.list()[2];
  readVals = new AP_Sync(this, serialPort, 9600);
  
  // Load Images
  Title = loadImage("Title.jpg");
  PoseSit1 = loadImage ("PoseSit1.jpg");
  PoseSit2 = loadImage ("PoseSit2.jpg");
  PoseHR = loadImage ("PoseHR.jpg");
  PoseHL = loadImage ("PoseHL.jpg");
  PoseFR = loadImage ("PoseFR.jpg");
  PoseFL = loadImage ("PoseFL.jpg");
  PoseHBoth = loadImage ("PoseHBoth.jpg");
  PoseFBoth = loadImage ("PoseFBoth.jpg");
  PoseHLFL = loadImage ("PoseHLFL.jpg");
  

  
}

void draw(){
  if (Asensor1> 1013) {
  image(PoseSit1, 0, 0, width, height);
  }
  else if (Csensor1R>1014) {
  image(PoseHR, 0, 0, width, height);
  }
  else if (Csensor1L>1014) {
  image(PoseHL, 0, 0, width, height);
  }
  else if (Csensor2R>1014) {
  image(PoseFR, 0, 0, width, height);
  }
  else if (Csensor2L>1014) {
  image(PoseFL, 0, 0, width, height);
  }
  else if (Csensor1R==0 && Csensor1L==0) {
  image(PoseHBoth, 0, 0, width, height);
  }
  else if (Csensor2R==0 && Csensor2L==0) {
  image(PoseFBoth, 0, 0, width, height);
  }
  else if (Csensor1L==0 && Csensor2L==0) {
  image(PoseHLFL, 0, 0, width, height);
  }
  else {
  image(Title, 0, 0, width, height);
  } 
  
}

/*
  else if (Csensor1R>1013) {
  image(PoseHR, 0, 0, width, height);
  }
  else if (Csensor1L>1013) {
  image(PoseHL, 0, 0, width, height);
  }
  else if (Csensor2R>1013) {
  image(PoseFR, 0, 0, width, height);
  }
  else if (Csensor2L>1013) {
  image(PoseFL, 0, 0, width, height);
  }
  else if (Csensor1R=0 && Csensor1L=0) {
  image(PoseHBoth, 0, 0, width, height);
  }
  else if (Csensor2R=0 && Csensor2L=0) {
  image(PoseFBoth, 0, 0, width, height);
  }
  else if (Csensor1L=0 && Csensor2L=0) {
  image(PoseHLFL, 0, 0, width, height);
  }
  */
