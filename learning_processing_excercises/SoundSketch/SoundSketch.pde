import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in; 
AudioRecorder recorder;
AudioOutput out;
FilePlayer player;

boolean recording = false;

void setup() {
  size(500, 500);
  minim = new Minim(this);
  // We use minim.getLineIn() to get access to the microphone data
  in = minim.getLineIn();
  recorder = minim.createRecorder(in, "file.wav");
  out = minim.getLineOut( Minim.STEREO );
}

void draw() {
  
}


void keyPressed() {
  if (key == 'r') {
    if (!recorder.isRecording()) {
      println("Recording.");
      recorder.beginRecord();
    } else {
      println("Stop recording.");
      recorder.endRecord();    
      if (player != null) {
       player.unpatch(out);
       player.close();
      }
      player = new FilePlayer(recorder.save());
      player.patch(out);
      println("Playing.");
      player.play();
      
      recorder = minim.createRecorder(in, "file.wav");
    }
  }
}