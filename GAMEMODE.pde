
//--------------------------------------------------------------
// Game mode: Main gameplay screen with falling colored text
//--------------------------------------------------------------

void GAMEMODE () {
 //Screen layout
 background(255,255,255);
 arrowFont = createFont("SansSerif", 70);
 KidsMagazine = createFont("Kids Magazine.ttf",60);
 
 //Right Button
 fill(255,255,255);
 rect(450,0, 450,900);
 
 //Text labelling the right button
 fill(0);
 textSize(60);
 textAlign(CENTER,CENTER);
 textFont(KidsMagazine);
 text("DON'T",675,100);
 text("MATCH",675,300);
 
 //Left Button
 rect(0,0, 450,900);
 
 //Text labelling the left button
 fill(255,255,255);
 textSize(60);
 textAlign(CENTER,CENTER);
 textFont(KidsMagazine);
 text("MATCH",225,200);
 
 //Font for the falling words
 textSize(50);
 textFont(KidsMagazine);
 textAlign(CENTER,CENTER);
 
 //Falling text animation
 if (!gameOver) {
    //Speed of falling increases with score
    yPosition += 0.8*score;
    //Speed of rotation increased with score.
    angle2 += 0.025*score;
    
    // Animated text properties
    pushMatrix();
    //Ensures its falling from the middle.
    translate(width/2, yPosition);
    rotate(angle2);
    fill(currentColor);
    text(currentWord, 0, 0);
    popMatrix();
   
   // End game if text reaches bottom(Time limited)
   if (yPosition > height) {
  gameOver = true;
 }
}
  
  //When game ends,switch to gameover mode.
  if (gameOver == true) {
   mode = 2;
  }
  
 
} 
   
   

//--------------------------------------------------------------
// Generates new word-color pair: 50% chance of being matching pair
//--------------------------------------------------------------
  
  

void generateNewPair() {
  currentWord = words[(int)random(words.length)];
  color wordColor = colors[(int)random(colors.length)];
  currentColor = wordColor;
  
  // Randomly decide if pair should match(this makes sure its 50%)
  if (random(1) > 0.5) {
    currentColor = colorFromWord(currentWord);
    isMatching = true;
  } else {
    // Ensure mismatch
    while (colorFromWord(currentWord) == currentColor) {
      currentColor = colors[(int)random(colors.length)];
    }
    isMatching = false;
  }
  
  // Reset animation properties every time generating a new word
  yPosition = 0;
  angle2 = 0;
}


//--------------------------------------------------------------
// Case statement
// Converts color words to actual color values
// Parameters: word - the color name to convert
// Returns: corresponding color value
//--------------------------------------------------------------

color colorFromWord(String word) {
  switch(word) {
    case "RED": return red;
    case "GREEN": return green;
    case "BLUE": return blue;
    case "YELLOW": return yellow;
    case "PURPLE": return purple;
    case "PINK":return pink;
    case "BLACK":return black;
    case "GREY":return grey;
    case "WHITE":return white;
    case "ORANGE":return orange;
    case "BROWN":return brown;
    case "SILVER":return silver;
    case "GOLD":return gold;
    default: return black;
  }
}
