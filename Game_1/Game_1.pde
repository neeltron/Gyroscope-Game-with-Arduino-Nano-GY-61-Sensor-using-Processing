import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float val2 = 0;
PImage img;
PImage bg;
PImage grass;
float carX;
float carY;
float speed;
float concentration;
float stripeX;
float score;
int currentScene;
int mp;
Camera worldCamera;
void setup() {
  size(1920, 1080);
  img = loadImage("sprite6.png");
  carX = 60600;
  speed = 0.1;
  concentration = 100;
  stripeX = 10;
  worldCamera = new Camera();
  score = 0;
  bg = loadImage("bg3.jpg");
  grass = loadImage("grass2.jpg");
  carY = height/2;
  mp = 1;
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  if(mp == 2) {
    
  }
}
void draw() {
  
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');
  String val3 = "";
  if(val != null) {
  val3 = val.replaceAll("[^\\d.-]", "");
  }
  if(val3 == null || val3 == "") {
    val2 = 0; 
    val3 = "0";
    val = "0";
  }
  // read it and store it in val
  val2 = Float.parseFloat(val3);
  
  println(val);
  } 
 //print it out in the console
  switch(mp) {
  case 1: 
    Scene1();
    break;
  case 2: 
    Scene2();
    break;
  case 3: 
    Scene3();
    break;
  default: 
    Scene1();
  }
}
void mousePressed() {
  switch(mp) {
  case 1: 
    mp = 2;
    break;
  case 3:
    System.exit(0);
    break;
  }
}
