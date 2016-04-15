import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;
PFont fontMy;                                    //declaring font
boolean bReleased = true;       //no permament sending when finger is tap
KetaiBluetooth bt;                  // Create object from BtSerial class
boolean isConfiguring = true;
String info = "";
KetaiList klist;
ArrayList devicesDiscovered = new ArrayList(); //store in array the discovered device
boolean rectOver = false;
int rec = 0;

// The following code is required to enable bluetooth at startup.
void onCreate(Bundle savedInstanceState)
{
  super.onCreate(savedInstanceState);
  bt = new KetaiBluetooth(this);//create the BtSerial object that will handle the connection
}

void onActivityResult(int requestCode, int resultCode, Intent data)
{
    bt.onActivityResult(requestCode, resultCode, data);
}//to show the discovered device

void setup()
{
  size(displayWidth, displayHeight); //size of my phone screen
  smooth();
  frameRate(10);                        //the frame rate of my screen
  orientation(PORTRAIT);        //vertical
  bt.start();                                 //start listening for BT connections
  isConfiguring = true;               //at my phone start select device…
  fontMy = createFont("SansSerif", 20); //font size
  textFont(fontMy);
}

void draw()
{
//at app start select device
if (isConfiguring)

{
ArrayList names;

//create the BtSerial object that will handle the connection
//with the list of paired devices
klist = new KetaiList(this, bt.getPairedDeviceNames());

isConfiguring = false;                         //stop selecting device
}

else
{
  color a = color(255,0,0);                      //the color for each button of the interface
  color b = color(255,0,0);
  color c = color(255,0,0);
  color d = color(255,0,0);
  color e = color(165,8,27);
  color f = color(165,8,27);
  color g = color(165,8,27);
  color h = color(165,8,27);
  color i = color(18,21,121);
  color j = color(255,255,255);
  color k = color(255,255,255);
  color l = color(0,0,0);
  update(mouseX, mouseY);                 //update our finger point at where of the screen
  background(45,12,137);                      //background color

if((mousePressed)&&(rectOver)&&(rec==1))  //when we click the button’s color change  accordingly with different color code
{      c = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==2))
{       d = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==3))
{       a = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==4))
{       b = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==5))
{       j = color(74,182,252);
}
else if ((mousePressed)&&(rectOver)&&(rec==6))
{      k = color(74,182,252);
}
else if ((mousePressed)&&(rectOver)&&(rec==7))
{      e = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==8))
{      f = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==9))
{      g = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==10))
{      h = color(10,237,26);
}
else if ((mousePressed)&&(rectOver)&&(rec==11))
{      l = color(255,255,255);
}


if ((rec == 2) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
// If our finger is on the square,
    byte[] data = {'w'};           // send w to arduino when we click the button 2
    bt.broadcast(data);              //send with bt
    bReleased = false;               // send data for once until next time we click the button again
  }
if ((rec == 1) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'s'};           // send s to arduino when we click the button 1
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
  if ((rec == 3) && (rectOver)&&(mousePressed) && (bReleased == true)) {
    byte[] data = {'a'};           // send a to arduino when we click the button 3
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
  if ((rec == 4) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'d'};           // send d to arduino when we click the button 4
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
  if ((rec == 5) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'l'};           // send l to arduino when we click the button 5(ellipse)
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }

  if ((rec == 6) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'k'};           // send k to arduino when we click the button 6(ellipse)
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
    if ((rec == 7) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'q'};           // send q to arduino when we click the button 7
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
    if ((rec == 8) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'e'};           // send e to arduino when we click the button 8
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
    if ((rec == 9) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'z'};           // send z to arduino when we click the button 9
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
    if ((rec == 10) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'c'};           // send c to arduino when we click the button 10
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }


      if ((rec == 11) && (rectOver)&&(mousePressed) && (bReleased == true)) { 
    byte[] data = {'t'};                 // send t to arduino when we click the button 3
    bt.broadcast(data);              //send with bt
    bReleased = false;
  }
 
 
if((rectOver)&&(mousePressed == false)&& (bReleased == false))
  {                    //when our finger move up from the button, send stop command to arduino
    byte[] data = {' '};             
    bt.broadcast(data);
    bReleased = true;
  }

  fill(a);                                                //fill each area of button with the color declared above
  stroke(162); //the shape covered with a grey color line
  triangle(200,250,250,150,300,250);              //draw the triangle with the coordinates
   fill(b);
   triangle(200,600,250,700,300,600);
   fill(c);
   triangle(150,375,50,425,150,475);
    fill(d);
    triangle(350,375,450,425,350,475);
    fill(e);
    triangle(425,240,325,290,400,340);  //325
    fill(f);
    triangle(400,510,325,560,425,610);  //325
    fill(g);
    triangle(75,240,175,290,100,340); //75
    fill(h);
    triangle(100,510,175,560,75,610); //75
   fill(i);
   stroke(172);
    rect(380,80,70,70);                  //draw 2 rectangle below the sphere(ellipse)
    rect(380,700,70,70);
    stroke(0);
    fill(j);
    ellipse(415,115,85,85);            //draw sphere with diameter 85
    fill(k);
    ellipse(415,735,85,85);
    fill(l);
    stroke(255);
    ellipse(25,25,30,30);
}

//to print received data and show on screen
fill(255);
noStroke();
textAlign(LEFT);
text(info, 20, 104);
noFill();
}

void update(int x, int y) {       //to control the flag when we click a button
 if ( overRect(200, 150, 100, 100) ) {
    rectOver = true;                   //left right
    rec = 3;
  }
  else if
  ( overRect(50, 375, 100, 100) ) {
    rectOver = true;                   //up down
    rec = 1;
  }
  else if
  ( overRect(350, 375, 100, 100) ) {
    rectOver = true;
        rec = 2;                            //up down
  }
  else if
  ( overRect(200, 600, 100, 100) ) {
    rectOver = true;                   //left right
        rec = 4;
  }
    else if
  ( overRect(372,72,85,85) ) {
    rectOver = true;
        rec = 5;                            //for ellipse 1
  }
    else if
  ( overRect(372,692,85,85) ) {
    rectOver = true;
        rec = 6;                            //for ellipse 2
  }
      else if
  ( overRect(325, 240, 100, 100) ) {
    rectOver = true;
        rec = 7;                            //up left
  }
      else if
  ( overRect(325, 510, 100, 100) ) {
    rectOver = true;
        rec = 8;                            //up right
  }
      else if
  ( overRect(75, 240, 100, 100) ) {
    rectOver = true;
        rec = 9;                            //btm left
  }
      else if
  ( overRect(75, 510, 100, 100) ) {
    rectOver = true;
        rec = 10;                          //btm right
  }
        else if
  ( overRect(10, 10, 30, 30) ) {
    rectOver = true;
        rec = 11;                          //stop
  }
  else
  {
    rectOver = false;                 //nothing s touched on screen
  }
}

boolean overRect(int x, int y, int width, int height)  { // to scan we touch which area
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height)             //to see if the mouse cursor inside rect
  {
    return true;
  } else {
    return false;
  }
}

void onKetaiListSelection(KetaiList klist)
{
  String selection = klist.getSelection();            //select the device to connect
  bt.connectToDeviceByName(selection);        //connect to the device
  klist = null;                                                      //dispose of bluetooth list for now
}

//Call back method to manage data received
void onBluetoothDataEvent(String who, byte[] data)
{
  if (isConfiguring) return;      //received
  info += new String(data);
  if(info.length() > 150)             //clean the words on screen if string to long
  info = "";
}
//END of Android processing coding
