// Eric Li
// Feb 13th
// A color-matching game with audio and animation elements

// Import required Minim libraries for audio handling

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Game mode framework variables

//the initial mode is 0
int mode=0;
//the mode during the game
final int GAMEMODE=1;
//the mode after game ends
final int GAMEOVERMODE=2;
//the mode before game starts
final int INTROMODE = 0;

// Audio system variables
Minim minim;
AudioPlayer Song, Sound1, Sound2;
AudioInput Input;

// Gameplay variables

// Currently displayed text
String currentWord;
// Currently displayed color
color currentColor;
// Whether text and color match
boolean isMatching;
 // Vertical position of falling text
float yPosition=0;
// Rotation angle of falling text
float angle2=0;
//Current game score
int score = 0;
// All-time best score
int bestscore = 0;
//Game state flag
boolean gameOver = false;

// Font and animation variables

//Font for title text
PFont KidsMagazine;
//Font for the special text in the button
PFont arrowFont;
//Angle for title animation
float angle = -HALF_PI;

//Graphics variable

// Array for intro animation frames
PImage [] gif;
// Total animation frames
int NumberOfFrames;
 // Current animation frame
int f;

// Color definitions
//red color
color red = #FF0000;
//green color
color green = #00FF00;
//blue color
color blue = #0000FF;
//yellow color
color yellow = #FFFF00;
//purple color
color purple = #800080;
//pink color
color pink = #FFC0CB;
//black color
color black = #000000;
//grey color
color grey = #808080;
//white color
color white = #FFFFFF;
//orange color
color orange = #FFA500;
//brown color
color brown = #964B00;
//silver color
color silver = #C0C0C0;
//gold color
color gold = #FFD700;

// Word and color arrays

//words randomly generated
String[] words = {"RED", "GREEN", "BLUE", "YELLOW","PURPLE","PINK","BLACK","GREY","WHITE","ORANGE","BROWN","SILVER","GOLD"};
//colors randomly generated
color[] colors = {red,green,blue,yellow,purple,pink,grey,white,orange,brown,silver,gold};

//--------------------------------------------------------------
// Setup function: Initializes game window and loads resources
//--------------------------------------------------------------

void setup() {
  //create font for text in the button
  arrowFont = createFont("SansSerif", 70);
  //size of window
  size(900,900,P2D);
  //background color
  background(255,255,255);
  
  // Initialize audio system
  minim = new Minim (this);
   
  // Load all audio files
  Song = minim.loadFile("thememusic.mp3");
  Sound1 = minim.loadFile("FAILURE.wav");
  Sound2 = minim.loadFile("SUCCESS.wav");
  
  Song.loop();
  
 //Input = minim.getLineIn();
  
}

//--------------------------------------------------------------
// Main draw loop: Handles screen updates based on game mode
//--------------------------------------------------------------

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
   
//--------------------------------------------------------------
// Mouse input handler: Controls game state transitions and gameplay input
//--------------------------------------------------------------

// Circle button navigation logic
void mousePressed() {
  if (dist(800, 800, mouseX, mouseY) < 50) {
    mode = (mode + 1) % 3;
    yPosition = 0;
    angle2 = 0;
    gameOver = false;
   
   
// Reset game when entering play mode
    if (mode == 1) {
      score = 0;
      generateNewPair();
    }
    return;
  }
  
// Circle button navigation logic
 if (dist(800, 800, mouseX, mouseY) < 50) {
    mode = (mode + 1) % 3;
    yPosition = 0;
    angle2 = 0;
    gameOver = false;
    
    if (mode == GAMEMODE) {
      score = 0;
      generateNewPair();
    }
    return;
  }

  // Gameplay input handling
  if (mode == GAMEMODE) {
    boolean userChoice = false;
    // Left half = match, Right half = no match
    if (mouseX > 0 && mouseX < 450) {
      userChoice = true; 
    } else if (mouseX > 450 && mouseX < 900) {
      userChoice = false; 
    } 
    
    if (userChoice == isMatching) {
      // SUCCESS
      Sound2.rewind(); // Reset sound to start
      Sound2.play(); 
      score++;
      generateNewPair();
       // Update best score if current score is higher
      if (score > bestscore) bestscore = score;
    } else {
      // FAILURE
      Sound1.rewind();
      Sound1.play();
      gameOver = true;
    }
  }
  
  //Game over screen restart logic
  if (mode == GAMEOVERMODE) {
    gameOver = false;
    score = 0;
    generateNewPair();
    mode = GAMEMODE;
  }
}
  
  



//--------------------------------------------------------------
// Memory cleanup: Releases audio resources to prevent memory leaks or overflow
//--------------------------------------------------------------

void cleanupMemory() {
  
  if (Song != null) {
    Song.close();
    Song = null;
  }
  
  if (Sound1 != null) {
    Sound1.close();
    Sound1 = null;
  }
  
  if (Sound2 != null) {
    Sound2.close();
    Sound2 = null;
  }
  
  if (Input != null) {
    Input.close();
    Input = null;
  }
  minim.stop();


 // Clean up GIF frames
  if (gif != null) {
    for (int i = 0; i < gif.length; i++) gif[i] = null;
    gif = null;
 }
}

void stop() {
  Song.close();
  minim.stop();
  super.stop();
}
 
