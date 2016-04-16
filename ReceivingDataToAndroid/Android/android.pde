//String info="178";




import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;
import android.util.Log;

private static final String TAG = "Test2";

float val=0;
char[] val1={'0','o','0'};

PFont fontMy;

KetaiBluetooth bt;
KetaiList klist;
boolean isConfiguring = true;
String info = "";
int rectColFactor = 0;

ArrayList devicesDiscovered = new ArrayList();

void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  bt = new KetaiBluetooth(this);
}

void onActivityResult(int requestCode, int resultCode, Intent data) {
  bt.onActivityResult(requestCode, resultCode, data);
}

void setup() {
  size(displayWidth,displayHeight);
  background(0,0,0);
  //for(int p=0;p<info.length();p++) {
  //    val1[p]=info.charAt(info.length()-p-1);
  //      val=val+pow(10,p)*(int)(val1[p]-'0'); 
        
        bt.start();
  //at app start select device…
  isConfiguring = true;
  //font size
  fontMy = createFont("SansSerif", 40);
  textFont(fontMy);
  
}

void draw() {
if (isConfiguring) 
  { 
    print("configuring");
    ArrayList names;
    background(78, 93, 75);
    klist = new KetaiList(this, bt.getPairedDeviceNames());
    isConfiguring = false; // make the "configuring" status false as we have successfully configured
  } else
  { 
    background(150, 150, 150);
    
    fill(255);
noStroke();
textAlign(LEFT);
textSize(40);
text(info, 20, 104);
noFill();
//rect(height/2,width/2,Integer.valueOf(info),Integer.valueOf(info));
fill(0,255,0);
    
  }
}

//------------------------ For killing the list after you've selected a device to pair 

void onKetaiListSelection(KetaiList klist) {
  String selection = klist.getSelection();
  bt.connectToDeviceByName(selection);
  //dispose of list for now
  klist = null;
}



//------------------------ Call back method to manage data received
void onBluetoothDataEvent(String who, byte[] data) {
  int val = 0;
  
  if (isConfiguring) {
    return;
  }

  if (data != null){
     String in = new String(data);

     if (in.charAt(0) != ' '){
       String sub_in = in.substring(0, in.length() - 2);

       val = Integer.valueOf(sub_in);
       print("Value in integer: ");
       print(val);
       println();
     }
  }
  
  info = String.valueOf(val);
  print("Converted into string again: " + info);
}
