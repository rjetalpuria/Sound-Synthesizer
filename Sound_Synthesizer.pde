//Rushi Jetalpuria
//Sound Synthesizer:
import processing.sound.*;

int index=0;    //index for the note array
int volume=1;
int waveform=1;    //to choose from sin, square or saw
float[] soundNote= new float[14];   //the array note
SinOsc soundOutput;
SinOsc soundOutputC1;  //c=clone
SinOsc soundOutputC2;
SinOsc soundOutputC3;
SqrOsc soundOutput2;
SqrOsc soundOutput2C1;
SqrOsc soundOutput2C2;
SqrOsc soundOutput2C3;
SawOsc soundOutput3;
SawOsc soundOutput3C1;
SawOsc soundOutput3C2;
SawOsc soundOutput3C3;
//filter variables
LowPass lowPass;
HighPass highPass;
BandPass bandPass;
int lowValue=160;
int highValue=1600;
int bandValue1=160;
int bandValue2=400;
//special effects
Delay delay;
Reverb reverb;
//for EQ
int lows1=200;
int lows2=200;
int mids1=500;
int mids2=500;
int highs1=800;
int highs2=800;
float dTime=0.5;
float rDamp=0.5;

void setup() {
  size(800, 500);
  //creating sound
  soundOutput= new SinOsc(this);
  soundOutputC1=new SinOsc(this);
  soundOutputC2=new SinOsc(this);
  soundOutputC3=new SinOsc(this);

  soundOutput2 = new SqrOsc(this);
  soundOutput2C1 = new SqrOsc(this);
  soundOutput2C2=new SqrOsc(this);
  soundOutput2C3=new SqrOsc(this);

  soundOutput3 = new SawOsc (this);
  soundOutput3C1 = new SawOsc(this);
  soundOutput3C2=new SawOsc(this);
  soundOutput3C3=new SawOsc(this);
  //loading filters
  lowPass = new LowPass (this);
  highPass = new HighPass (this);
  bandPass = new BandPass (this);
  delay=new Delay(this);
  reverb=new Reverb(this);
  //playing sounds
  soundOutput.play();
  soundOutputC1.play();
  soundOutputC2.play();
  soundOutputC3.play();

  soundOutput2.play();
  soundOutput2C1.play();
  soundOutput2C2.play();
  soundOutput2C3.play();

  soundOutput3.play();
  soundOutput3C1.play();
  soundOutput3C2.play();
  soundOutput3C3.play();
  //playing sound at 'volume' amplitude
  soundOutput.amp(volume);
  soundOutputC1.amp(volume);
  soundOutputC2.amp(volume);
  soundOutputC3.amp(volume);

  soundOutput2.amp(volume);
  soundOutput2C1.amp(volume);
  soundOutput2C2.amp(volume);
  soundOutput2C3.amp(volume);

  soundOutput3.amp(volume);
  soundOutput3C1.amp(volume);
  soundOutput3C2.amp(volume);
  soundOutput3C3.amp(volume);
  //only playing the sin osc at the freq of note
  soundOutput.freq(soundNote[index]);
  soundOutputC1.freq(soundNote[index]);
  soundOutputC2.freq(soundNote[index]);
  soundOutputC3.freq(soundNote[index]);

  soundOutput2.freq(0);
  soundOutput2C1.freq(0);
  soundOutput2C2.freq(0);
  soundOutput2C3.freq(0);

  soundOutput3.freq(0);
  soundOutput3C1.freq(0);
  soundOutput3C2.freq(0);
  soundOutput3C3.freq(0);
  //loading the array with freq
  soundNote[0]=216.88;    //C4
  soundNote[1]=293.66;    //D4
  soundNote[2]=329.63;    //E4
  soundNote[3]=349.23;    //F4
  soundNote[4]=392.00;    //G4
  soundNote[5]=440.00;    //A4
  soundNote[6]=493.88;    //B4
  soundNote[7]=523.25;    //C5
  soundNote[8]=587.33;    //D5
  soundNote[9]=659.25;    //E5
  soundNote[10]=698.46;    //F5
  soundNote[11]=783.99;    //G5
  soundNote[12]=880.00;    //A5
  soundNote[13]=987.77;    //B5
}

void draw() {
  background(150);
  //drawing the layout
  strokeWeight(3);
  stroke(255);
  line(260, 0, 260, 500);
  line(540, 0, 540, 500);
  line(260, 140, 540, 140);
  line(260, 290, 540, 290);
  textSize(40);
  fill(#c3ff00);  //green
  text("Note & Freq:", 280, 60);
  text("Oscillator:", 300, 200);
  text("Volume:", 540, 400);
  fill(#B703FF);  //purple
  text("Sound Effects:", 265, 340);
  fill(#ffff00);  //yellow
  text("Filters:", 60, 60);
  fill(#0033cc);  //blue
  text("Equalizer:", 590, 60);
  textSize(30);
  fill(#ff0000);  //red
  text("Low Pass:~L", 5, 100);
  text("High Pass:~H", 5, 200);
  text("Band Pass:(low)", 5, 300);
  text("Band Pass:(high)", 5, 400);
  text("~B", 180, 350);
  text("~B", 180, 450);
  fill(#00F9FF);  //cyan
  text("Lows1:7", 560, 100);
  text("Lows2:", 690, 100);
  text("Mids1:8", 560, 200);
  text("Mids2:", 690, 200);
  text("Highs1:9", 560, 300);
  text("High2:", 690, 300);
  fill(#ffa500);  //orange
  //typing the note and it's freq
  if (index==0) {
    text("C4: "+soundNote[index], 310, 110);
  } else  if (index==1) {
    text("D4: "+soundNote[index], 310, 110);
  } else  if (index==2) {
    text("E4: "+soundNote[index], 310, 110);
  } else  if (index==3) {
    text("F4: "+soundNote[index], 310, 110);
  } else  if (index==4) {
    text("G4: "+soundNote[index], 310, 110);
  } else  if (index==5) {
    text("A4: "+soundNote[index], 310, 110);
  } else  if (index==6) {
    text("B4: "+soundNote[index], 310, 110);
  } else  if (index==7) {
    text("C5: "+soundNote[index], 310, 110);
  } else  if (index==8) {
    text("D5: "+soundNote[index], 310, 110);
  } else  if (index==9) {
    text("E5: "+soundNote[index], 310, 110);
  } else  if (index==10) {
    text("F5: "+soundNote[index], 310, 110);
  } else  if (index==11) {
    text("G5: "+soundNote[index], 310, 110);
  } else  if (index==12) {
    text("A5: "+soundNote[index], 310, 110);
  } else  if (index==13) {
    text("B5: "+soundNote[index], 310, 110);
  }
  //drawing all the buttons
  text(volume, 540, 440);
  text("~UP-", 700, 400);
  text("DOWN", 700, 430);
  text("~LEFT-RIGHT", 290, 140);
  text("~1~2~3", 340, 230);
  if (waveform==1) {
    text("Sine Oscillator", 290, 260);
  } else if (waveform==2) {
    text("Square Oscillator", 275, 260);
  } else if (waveform==3) {
    text("Saw Oscillator", 300, 260);
  }
  strokeWeight(1);
  fill(#FF03E6);
  text("Delay Time:~4", 270, 370);
  text("Reverb Damp:~5", 270, 450);
  rect(290, 380, 20, 40);
  rect(420, 380, 20, 40);
  rect(290, 455, 20, 40);
  rect(420, 455, 20, 40);
  fill(#B703FF);
  text("-", 292, 410);
  text(dTime, 310, 410);
  text("+", 420, 410);
  text("-", 292, 485);
  text(rDamp, 310, 485);
  text("+", 420, 485);

  fill(#ffff00);
  rect(20, 120, 20, 40);
  rect(150, 120, 20, 40);
  rect(20, 220, 20, 40);
  rect(150, 220, 20, 40);
  rect(20, 320, 20, 40);
  rect(150, 320, 20, 40);
  rect(20, 420, 20, 40);
  rect(150, 420, 20, 40);

  fill(#00F9FF);
  rect(550, 120, 20, 40);
  rect(640, 120, 20, 40);
  rect(670, 120, 20, 40);
  rect(770, 120, 20, 40);
  rect(550, 220, 20, 40);
  rect(640, 220, 20, 40);
  rect(670, 220, 20, 40);
  rect(770, 220, 20, 40);
  rect(550, 320, 20, 40);
  rect(640, 320, 20, 40);
  rect(670, 320, 20, 40);
  rect(770, 320, 20, 40);

  fill(#ff0000);
  text("-", 22, 150);
  text(lowValue, 65, 150);
  text("+", 150, 150);
  text("-", 22, 250);
  text(highValue, 60, 250);
  text("+", 150, 250);
  text("-", 22, 350);
  text(bandValue1, 65, 350);
  text("+", 150, 350);
  text("-", 22, 450);
  text(bandValue2, 65, 450);
  text("+", 150, 450);

  fill(#0033cc);
  text("-", 552, 150);
  text(lows1, 585, 150);
  text("+", 640, 150);
  text("-", 672, 150);
  text(lows2, 690, 150);
  text("+", 770, 150);
  text("-", 552, 250);
  text(mids1, 575, 250);
  text("+", 640, 250);
  text("-", 672, 250);
  text(mids2, 690, 250);
  text("+", 770, 250);
  text("-", 552, 350);
  text(highs1, 575, 350);
  text("+", 640, 350);
  text("-", 672, 350);
  text(highs2, 690, 350);
  text("+", 770, 350);
  textSize(20);
  text("Press 6 for Delay & Reverb special effect", 540, 460);
  text("special effect.", 660, 490);
}

void keyPressed() {
  if (key==CODED) {
    //right arrow key changes the note to the right
    if (keyCode == RIGHT) {
      if (index<13) {
        ++index;
      } else if (index==13) {
        index=0;
      }
      if (waveform==1) {
        soundOutput.freq(soundNote[index]);
        soundOutputC1.freq(soundNote[index]);
        soundOutputC2.freq(soundNote[index]);
        soundOutputC3.freq(soundNote[index]);
      } else if (waveform==2) {
        soundOutput2.freq(soundNote[index]);
        soundOutput2C1.freq(soundNote[index]);
        soundOutput2C2.freq(soundNote[index]);
        soundOutput2C3.freq(soundNote[index]);
      } else if (waveform==3) {
        soundOutput3.freq(soundNote[index]);
        soundOutput3C1.freq(soundNote[index]);
        soundOutput3C2.freq(soundNote[index]);
        soundOutput3C3.freq(soundNote[index]);
      }
    }
    //right arrow key changes the note to the left
    if (keyCode == LEFT) {
      if (index>0) {
        --index;
      } else if (index==0) {
        index=13;
      }
      if (waveform==1) {
        soundOutput.freq(soundNote[index]);
        soundOutputC1.freq(soundNote[index]);
        soundOutputC2.freq(soundNote[index]);
        soundOutputC3.freq(soundNote[index]);
      } else if (waveform==2) {
        soundOutput2.freq(soundNote[index]);
        soundOutput2C1.freq(soundNote[index]);
        soundOutput2C2.freq(soundNote[index]);
        soundOutput2C3.freq(soundNote[index]);
      } else if (waveform==3) {
        soundOutput3.freq(soundNote[index]);
        soundOutput3C1.freq(soundNote[index]);
        soundOutput3C2.freq(soundNote[index]);
        soundOutput3C3.freq(soundNote[index]);
      }
    }
    //up increases the volume
    if (keyCode ==UP) {
      ++volume;
      soundOutput.amp(volume);
      soundOutputC1.amp(volume);
      soundOutputC2.amp(volume);
      soundOutputC3.amp(volume);
      soundOutput2.amp(volume);
      soundOutput2C1.amp(volume);
      soundOutput2C2.amp(volume);
      soundOutput2C3.amp(volume);
      soundOutput3.amp(volume);
      soundOutput3C1.amp(volume);
      soundOutput3C2.amp(volume);
      soundOutput3C3.amp(volume);
    }
    //down derceases the volume
    if (keyCode== DOWN) {
      --volume;
      soundOutput.amp(volume);
      soundOutputC1.amp(volume);
      soundOutputC2.amp(volume);
      soundOutputC3.amp(volume);
      soundOutput2.amp(volume);
      soundOutput2C1.amp(volume);
      soundOutput2C2.amp(volume);
      soundOutput2C3.amp(volume);
      soundOutput3.amp(volume);
      soundOutput3C1.amp(volume);
      soundOutput3C2.amp(volume);
      soundOutput3C3.amp(volume);
    }
  }
  if (key != CODED) {
    //plays the sine oscillator
    if (key =='1') {
      waveform=1;
      soundOutput.freq(soundNote[index]);
      soundOutputC1.freq(soundNote[index]);
      soundOutputC2.freq(soundNote[index]);
      soundOutputC3.freq(soundNote[index]);
      soundOutput2.freq(0);
      soundOutput2C1.freq(0);
      soundOutput2C2.freq(0);
      soundOutput2C3.freq(0);
      soundOutput3.freq(0);
      soundOutput3C1.freq(0);
      soundOutput3C2.freq(0);
      soundOutput3C3.freq(0);
    }
    //plays the square oscillator
    if (key =='2') {
      waveform=2;
      soundOutput.freq(0);
      soundOutputC1.freq(0);
      soundOutputC2.freq(0);
      soundOutputC3.freq(0);
      soundOutput2.freq(soundNote[index]);
      soundOutput2C1.freq(soundNote[index]);
      soundOutput2C2.freq(soundNote[index]);
      soundOutput2C3.freq(soundNote[index]);
      soundOutput3.freq(0);
      soundOutput3C1.freq(0);
      soundOutput3C2.freq(0);
      soundOutput3C3.freq(0);
    }
    //plays the saw oscillator
    if (key =='3') {
      waveform=3;
      soundOutput.freq(0);
      soundOutputC1.freq(0);
      soundOutputC2.freq(0);
      soundOutputC3.freq(0);
      soundOutput2.freq(0);
      soundOutput2C1.freq(0);
      soundOutput2C2.freq(0);
      soundOutput2C3.freq(0);
      soundOutput3.freq(soundNote[index]);
      soundOutput3C1.freq(soundNote[index]);
      soundOutput3C2.freq(soundNote[index]);
      soundOutput3C3.freq(soundNote[index]);
    }
    //turns on/updates the lowpass filter
    if (key == 'l' || key == 'L') {
      if (waveform==1) {
        lowPass.process(soundOutput, lowValue);
        lowPass.process(soundOutputC1, lowValue);
        lowPass.process(soundOutputC2, lowValue);
        lowPass.process(soundOutputC3, lowValue);
      } else if (waveform==2) {
        lowPass.process(soundOutput2, lowValue);
        lowPass.process(soundOutput2C1, lowValue);
        lowPass.process(soundOutput2C2, lowValue);
        lowPass.process(soundOutput2C3, lowValue);
      } else if (waveform==3) {
        lowPass.process(soundOutput3, lowValue);
        lowPass.process(soundOutput3C1, lowValue);
        lowPass.process(soundOutput3C2, lowValue);
        lowPass.process(soundOutput3C3, lowValue);
      }
    }
    //turns on/updates the highpass filter
    if (key =='h' || key =='H') {
      if (waveform==1) {
        highPass.process(soundOutput, highValue);
        highPass.process(soundOutputC1, highValue);
        highPass.process(soundOutputC2, highValue);
        highPass.process(soundOutputC3, highValue);
      } else if (waveform==2) {
        highPass.process(soundOutput2, highValue);
        highPass.process(soundOutput2C1, highValue);
        highPass.process(soundOutput2C2, highValue);
        highPass.process(soundOutput2C3, highValue);
      } else if (waveform==3) {
        highPass.process(soundOutput3, highValue);
        highPass.process(soundOutput3C1, highValue);
        highPass.process(soundOutput3C2, highValue);
        highPass.process(soundOutput3C3, highValue);
      }
    }
    //turns on/updates the badpass filter
    if (key =='b'|| key=='B') {
      if (waveform==1) {
        bandPass.process(soundOutput, bandValue1, bandValue2);
        bandPass.process(soundOutputC1, bandValue1, bandValue2);
        bandPass.process(soundOutputC2, bandValue1, bandValue2);
        bandPass.process(soundOutputC3, bandValue1, bandValue2);
      } else if (waveform==2) {
        bandPass.process(soundOutput2, bandValue1, bandValue2);
        bandPass.process(soundOutput2C1, bandValue1, bandValue2);
        bandPass.process(soundOutput2C2, bandValue1, bandValue2);
        bandPass.process(soundOutput2C3, bandValue1, bandValue2);
      } else if (waveform==3) {
        bandPass.process(soundOutput3, bandValue1, bandValue2);
        bandPass.process(soundOutput3C1, bandValue1, bandValue2);
        bandPass.process(soundOutput3C2, bandValue1, bandValue2);
        bandPass.process(soundOutput3C3, bandValue1, bandValue2);
      }
    }
    //turns on delay sound effect
    if (key=='4') {
      if (waveform==1) {
        delay.process(soundOutput, 5);
        delay.process(soundOutputC1, 5);
        delay.process(soundOutputC2, 5);
        delay.process(soundOutputC3, 5);
        delay.time(dTime);
      } else if (waveform==2) {
        delay.process(soundOutput2, 5);
        delay.process(soundOutput2C1, 5);
        delay.process(soundOutput2C2, 5);
        delay.process(soundOutput2C3, 5);
        delay.time(dTime);
      } else if (waveform==3) {
        delay.process(soundOutput3, 5);
        delay.process(soundOutput3C1, 5);
        delay.process(soundOutput3C2, 5);
        delay.process(soundOutput3C3, 5);
        delay.time(dTime);
      }
    }
    //turns on reverb sound effect
    if (key=='5') {
      if (waveform==1) {
        reverb.process(soundOutput);
        reverb.process(soundOutputC1);
        reverb.process(soundOutputC2);
        reverb.process(soundOutputC3);
        reverb.damp(rDamp);
      } else if (waveform==2) {
        reverb.process(soundOutput2);
        reverb.process(soundOutput2C1);
        reverb.process(soundOutput2C2);
        reverb.process(soundOutput2C3);
        reverb.damp(rDamp);
      } else if (waveform==3) {
        reverb.process(soundOutput3);
        reverb.process(soundOutput3C1);
        reverb.process(soundOutput3C2);
        reverb.process(soundOutput3C3);
        reverb.damp(rDamp);
      }
    }
    //turns on delay on current oscillator and reverb on next oscillator
    if (key=='6') {
      if (waveform==1) {
        delay.process(soundOutput, 5);
        delay.process(soundOutputC1, 5);
        reverb.process(soundOutput2C2);
        reverb.process(soundOutput2C3);
        delay.time(dTime);
        reverb.damp(rDamp);
      } else if (waveform==2) {
        delay.process(soundOutput2, 5);
        delay.process(soundOutput2C1, 5);
        reverb.process(soundOutput3C2);
        reverb.process(soundOutput3C3);
        delay.time(dTime);
        reverb.damp(rDamp);
      } else if (waveform==3) {
        delay.process(soundOutput3, 5);
        delay.process(soundOutput3C1, 5);
        reverb.process(soundOutputC2);
        reverb.process(soundOutputC3);
        delay.time(dTime);
        reverb.damp(rDamp);
      }
    }
    //turns on/updates the low band freq for the EQ
    if (key=='7') {
      if (waveform==1) {
        lowPass.process(soundOutput, lows1);
        highPass.process(soundOutputC1, lows2);
      } else if (waveform==2) {
        lowPass.process(soundOutput2, lows1);
        highPass.process(soundOutput2C1, lows2);
      } else if (waveform==3) {
        lowPass.process(soundOutput3, lows1);
        highPass.process(soundOutput3C1, lows2);
      }
    }
    //turns on/updates the mid band freq for the EQ
    if (key=='8') {
      if (waveform==1) {
        lowPass.process(soundOutputC1, mids1);
        highPass.process(soundOutputC2, mids2);
      } else if (waveform==2) {
        lowPass.process(soundOutput2C1, mids1);
        highPass.process(soundOutput2C2, mids2);
      } else if (waveform==3) {
        lowPass.process(soundOutput3C1, mids1);
        highPass.process(soundOutput3C2, mids2);
      }
    }
    //turns on/updates the high band freq for the EQ
    if (key=='9') {
      if (waveform==1) {
        lowPass.process(soundOutputC2, highs1);
        highPass.process(soundOutputC3, highs2);
      } else if (waveform==2) {
        lowPass.process(soundOutput2C2, highs1);
        highPass.process(soundOutput2C3, highs2);
      } else if (waveform==3) {
        lowPass.process(soundOutput3C2, highs1);
        highPass.process(soundOutput3C3, highs2);
      }
    }
  }
}

void mousePressed() {
  //button codes for the filters/EQs/Sound effects
  if (mouseX>=20 && mouseX<=40  && mouseY>=120 && mouseY<= 160) {
    lowValue=lowValue-20;
  } else if (mouseX>=150 && mouseX<=170  && mouseY>=120 && mouseY<= 160) {
    lowValue=lowValue+20;
  }
  if (mouseX>=20 && mouseX<=40  && mouseY>=220 && mouseY<= 260) {
    highValue=highValue-20;
  } else if (mouseX>=150 && mouseX<=170  && mouseY>=220 && mouseY<= 260) {
    highValue=highValue+20;
  }
  if (mouseX>=20 && mouseX<=40  && mouseY>=320 && mouseY<= 360) {
    bandValue1=bandValue1-20;
  } else if (mouseX>=150 && mouseX<=170  && mouseY>=320 && mouseY<= 360) {
    bandValue1=bandValue1+20;
  }
  if (mouseX>=20 && mouseX<=40  && mouseY>=420 && mouseY<= 460) {
    bandValue2=bandValue2-20;
  } else if (mouseX>=150 && mouseX<=170  && mouseY>=420 && mouseY<= 460) {
    bandValue2=bandValue2+20;
  }
  if (mouseX>=550 && mouseX<=570  && mouseY>=120 && mouseY<= 160) {
    lows1=lows1-20;
  } else if (mouseX>=640 && mouseX<=660  && mouseY>=120 && mouseY<= 160) {
    lows1=lows1+20;
  }
  if (mouseX>=670 && mouseX<=690  && mouseY>=120 && mouseY<= 160) {
    lows2=lows2-20;
  } else if (mouseX>=770 && mouseX<=790  && mouseY>=120 && mouseY<= 160) {
    lows2=lows2+20;
  }
  if (mouseX>=550 && mouseX<=570  && mouseY>=220 && mouseY<= 260) {
    mids1=mids1-20;
  } else if (mouseX>=640 && mouseX<=660  && mouseY>=220 && mouseY<= 260) {
    mids1=mids1+20;
  }
  if (mouseX>=670 && mouseX<=690  && mouseY>=220 && mouseY<= 260) {
    mids2=mids2-20;
  } else if (mouseX>=770 && mouseX<=790  && mouseY>=220 && mouseY<= 260) {
    mids2=mids2+20;
  }
  if (mouseX>=550 && mouseX<=570  && mouseY>=320 && mouseY<= 360) {
    highs1=highs1-20;
  } else if (mouseX>=640 && mouseX<=660  && mouseY>=320 && mouseY<= 360) {
    highs1=highs1+20;
  }
  if (mouseX>=670 && mouseX<=690  && mouseY>=320 && mouseY<= 360) {
    highs2=highs2-20;
  } else if (mouseX>=770 && mouseX<=790  && mouseY>=320 && mouseY<= 360) {
    highs2=highs2+20;
  }
  if (mouseX>=290 && mouseX<=310  && mouseY>=380 && mouseY<=420) {
    dTime=dTime-0.1;
  } else if (mouseX>=420 && mouseX<=440  && mouseY>=380 && mouseY<=420) {
    dTime=dTime+0.1;
  }
  if (mouseX>=290 && mouseX<=310  && mouseY>=455 && mouseY<=495) {
    rDamp=rDamp-0.1;
  } else if (mouseX>=420 && mouseX<=440  && mouseY>=455 && mouseY<=495) {
    rDamp=rDamp+0.1;
  }
}
