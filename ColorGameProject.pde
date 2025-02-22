//Eric Li
//Feb 13th
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
int mode=0;
final int GAMEMODE=1;
final int GAMEOVERMODE=2;
final int INTROMODE = 0;
Minim minim;
Minim minim2;
Minim minim3;
AudioPlayer Song;
AudioPlayer Sound1;
AudioPlayer Sound2;
AudioInput Input;
String currentWord;
color currentColor;
boolean isMatching;
float yPosition=0;
float angle2=0;
int score = 0;
boolean gameOver = false;
PFont KidsMagazine;
float angle = -HALF_PI;
PFont arrowFont;
PImage [] gif;
int NumberOfFrames;
int f;
color red = #FF0000;
color green = #00FF00;
color blue = #0000FF;
color yellow = #FFFF00;
color purple = #800080;
color pink = #FFC0CB;
color black = #000000;
color grey = #808080;
color white = #FFFFFF;
color orange = #FFA500;
color brown = #A52A2A;
color silver = #C0C0C0;
color gold = #FFD700;
String[] words = {"RED", "GREEN", "BLUE", "YELLOW","PURPLE","PINK","BLACK","GREY","WHITE","ORANGE","BROWN","SILVER","GOLD"};
color[] colors = {red,green,blue,yellow,purple,pink,grey,white,orange,brown,silver,gold};

void setup() {
  arrowFont = createFont("SansSerif", 70);
  size(900,900,P2D);
  background(255,255,255);
  
  minim = new Minim (this);
 Song = minim.loadFile("thememusic.mp3");
 Song.play();
 //Input = minim.getLineIn();
}

void draw() {
  if (mode == GAMEMODE) {
   GAMEMODE();
 } else if (mode == GAMEOVERMODE) {
   GAMEOVERMODE();
 } 
  else if (mode == INTROMODE) {
    INTROMODE();
  }
  
 
}
   

void mousePressed() {
  if (dist(800, 800, mouseX, mouseY) < 50) {
    mode = (mode + 1) % 3;
    yPosition = 0;
    angle2 = 0;
    gameOver = false;
    
   
    if (mode == 1) {
      score = 0;
      generateNewPair();
    }
    return;
  }

  if (mode == GAMEMODE) {
    boolean userChoice = false;
    if (mouseX > 0 && mouseX < 450) {
      userChoice = true; 
    } else if (mouseX > 450 && mouseX < 900) {
      userChoice = false; 
    } 
    
    if (userChoice == isMatching) {
      score++;
      generateNewPair();
    } else {
      gameOver = true;
    }
  }
  
  if (mode == GAMEOVERMODE) {
    gameOver = false;
    score = 0;
    generateNewPair();
    mode = GAMEMODE;
  }
}

void cleanupMemory() {
  
  if (Song != null) {
    Song.close();
    Song = null;
  }
  if (Input != null) {
    Input.close();
    Input = null;
  }
  minim.stop();

   if (gif != null) {
    for (int i = 0; i < gif.length; i++) {
      gif[i] = null; 
    }
    gif = null;
  }
}
