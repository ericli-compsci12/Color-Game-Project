void GAMEMODE () {
  
   minim2 = new Minim (this);
    minim3 = new Minim (this);
 Sound1 = minim2.loadFile("FAILURE.wav");
 Sound2 = minim3.loadFile("SUCCESS.wav");
 Input = minim.getLineIn();
  background(255,255,255);
  arrowFont = createFont("SansSerif", 70);
  KidsMagazine = createFont("Kids Magazine.ttf",60);
 

   
 fill(255,255,255);
 rect(450,0, 450,900);
 
 fill(0);
 textSize(60);
 textAlign(CENTER,CENTER);
 textFont(KidsMagazine);
 text("DON'T",675,100);
 text("MATCH",675,300);
 rect(0,0, 450,900);
 
 fill(255,255,255);
 textSize(60);
 textAlign(CENTER,CENTER);
 textFont(KidsMagazine);
 text("MATCH",225,200);
 
 textSize(50);
 textFont(KidsMagazine);
 textAlign(CENTER,CENTER);
 
 if (!gameOver) {
   
    yPosition += 0.8*score;
    angle2 += 0.025*score;
    
    pushMatrix();
    translate(width/2, yPosition);
    rotate(angle2);
    fill(currentColor);
    text(currentWord, 0, 0);
    popMatrix();
   
    
    if (yPosition > height) {
      gameOver = true;
    }
  }
  
  
  
  
  if (gameOver) {
   mode = 2;
  }
  
  if (mouseY > height-100 && mouseY < height-50) {
    boolean userChoice;
    if (mouseX > 200 && mouseX < 350) {
      userChoice = true; // Match
    } else if (mouseX > 450 && mouseX < 600) {
      userChoice = false; // Doesn't Match
    } else {
      return;
    }
    
    if (userChoice == isMatching) {
      score++;
      Sound2.play();
      generateNewPair();
    } else {
      gameOver = true;
      Sound1.play();
    }
  }
  
  
  
}

void generateNewPair() {
  currentWord = words[(int)random(words.length)];
  color wordColor = colors[(int)random(colors.length)];
  currentColor = wordColor;
  
  if (random(1) > 0.5) {
    currentColor = colorFromWord(currentWord);
    isMatching = true;
  } else {
    while (colorFromWord(currentWord) == currentColor) {
      currentColor = colors[(int)random(colors.length)];
    }
    isMatching = false;
  }
  
  yPosition = 0;
  angle2 = 0;
}

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
