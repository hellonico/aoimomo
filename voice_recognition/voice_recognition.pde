/*

 Simple voice recognizer
 
 
 */
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.speech.RecognizerIntent;

/************************************************************************
 
 --------------------------------  DATAS ---------------------------------
 
 *************************************************************************/
PFont androidFont;
String [] fontList;
int VOICE_RECOGNITION_REQUEST_CODE = 1234;

/************************************************************************
 
 --------------------------------  SETUP ---------------------------------
 
 *************************************************************************/
void setup() {
  orientation(LANDSCAPE);
  fontList = PFont.list();
  androidFont = createFont(fontList[0], 18, true);
  textFont(androidFont);


  PackageManager pm = getPackageManager();
  List<ResolveInfo> activities = pm.queryIntentActivities(
  new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH), 0);
  if (activities.size() != 0) {
    text("il y a un recognizer!", 20, 60);
  } 
  else {
    text("Recognizer not present", 20, 60);
  }
}

/************************************************************************
 
 --------------------------------  DRAW ---------------------------------
 
 *************************************************************************/
 
void draw() {
}
/************************************************************************
 
 --------------------------------  EVENTS ---------------------------------
 
 *************************************************************************/
 
void mousePressed() {
  startVoiceRecognitionActivity();
}

void startVoiceRecognitionActivity() {
  Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
  intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
  intent.putExtra(RecognizerIntent.EXTRA_PROMPT, "Speech recognition demo");
  intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ja");
  startActivityForResult(intent, VOICE_RECOGNITION_REQUEST_CODE);
}

void onActivityResult(int requestCode, int resultCode, Intent data) {
  if (requestCode == VOICE_RECOGNITION_REQUEST_CODE && resultCode == RESULT_OK) {
    background(0);
    // Fill the list view with the strings the recognizer thought it could have heard
    ArrayList<String>  matches = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);
    String s[] = (String[]) matches.toArray(new String[matches.size()]);
    fill(255);
    for (int i=0; i<s.length; i++) {
      text(s[i], 20, 60+(i*20));
    }
  }

  super.onActivityResult(requestCode, resultCode, data);
}

