/*

 This code install automatically the voice data you need for the text to speech engine
 
 */

import android.content.Context;
import android.speech.tts.TextToSpeech;
import android.speech.tts.TextToSpeech.OnInitListener;
import android.speech.tts.TextToSpeech.Engine;
import android.content.Intent;
import android.os.Bundle;

import java.util.Locale;

// We implement directly the texttospeech listener into the processing PApplet class
public class TTS extends PApplet implements TextToSpeech.OnInitListener {

  /************************************************************************
   
   --------------------------------  DATAS ---------------------------------
   
   *************************************************************************/

  private TextToSpeech mTts;
  int MY_DATA_CHECK_CODE = 0;
  int choix_lecture = 0;
  String Queneau [] = {
    "Adieu ma terre ronde", 
    "adieu mes arbres verts", 
    "je m’en vais dans la tombe", 
    "dire bonjour aux vers", 
    "tout poète à la ronde", 
    "peut saboter un vers", 
    "moi j’éteins la calbombe", 
    "et m’en vais boire un verre"
  };

  void setup() {
  }

  void draw() {
  }

  public void onCreate(Bundle savedInstance) {
    super.onCreate(savedInstance);
    initTTS();
  }
  //--------------------------------------------------------------------------------------
  //
  // TTS voice data is on your phone ?
  //
  //--------------------------------------------------------------------------------------
  private void initTTS() {
    Intent checkIntent = new Intent();
    checkIntent.setAction(TextToSpeech.Engine.ACTION_CHECK_TTS_DATA);
    startActivityForResult(checkIntent, MY_DATA_CHECK_CODE);
  }

  protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    if (requestCode == MY_DATA_CHECK_CODE) {
      if (resultCode == TextToSpeech.Engine.CHECK_VOICE_DATA_PASS) {
        mTts = new TextToSpeech(this, this);
      } 
      else {
        Intent installIntent = new Intent();
        installIntent.setAction(TextToSpeech.Engine.ACTION_INSTALL_TTS_DATA);
        startActivity(installIntent);
      }
    }
  }
  //--------------------------------------------------------------------------------------------------
  //
  //                                  FONCTION DECLANCHANT LA LECTURE
  //
  //--------------------------------------------------------------------------------------------------
  void parleMoi() {

    String choix =Queneau[choix_lecture];
    mTts.speak(choix, TextToSpeech.QUEUE_FLUSH, null);

    if (choix_lecture < Queneau.length-1) {
      choix_lecture++ ;
    }
    else {
      choix_lecture = 0;
    }
  }

  void mousePressed() {
    parleMoi();
  }

  //--------------------------------------------------------------------------------------------
  //
  //                                      INITIALISATION DU TTS
  //
  //--------------------------------------------------------------------------------------------

  public void onInit(int status) {
    if (status == TextToSpeech.SUCCESS) {
      // here you can choic your language
      int result = mTts.setLanguage(Locale.FRENCH);
      if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED) {
      } 
      else {
        parleMoi();
      }
    } 
    else {
      // Initialization failed.
      println("Could not initialize TextToSpeech.");
    }
  }
}

