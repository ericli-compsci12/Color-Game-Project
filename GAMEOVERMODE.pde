
//--------------------------------------------------------------
// Game over mode: Displays final score and restart option
//--------------------------------------------------------------

void GAMEOVERMODE () {
  // Animated text effect using oscillating property of sinusoidal graphs
  float currentSize = 80 + 20 * sin(angle);
  KidsMagazine = createFont("Kids Magazine.ttf",currentSize);
  arrowFont = createFont("SansSerif", 70);
  background(255,0,0);
  
  
 //The navigation button
 if (dist(800,800,mouseX,mouseY)<50) {
   fill(255,255,255);
   strokeWeight(2);
   stroke(0);
   } else {
     fill(0);
     strokeWeight(2);
   stroke(255, 255,255);
   }
   
 circle(800,800,100);
   
   //The arrow in the navigation button design
   if (dist(800,800,mouseX,mouseY)<50) {
   fill(0);
   textSize(90);
   textAlign(CENTER,CENTER);
   textFont(arrowFont);
   text("→",800,795);
   } else {
      fill(255,255,255);
   textSize(90);
   textAlign(CENTER,CENTER);
   textFont(arrowFont);
   text("→",800,795);
   }
 
 //Displaying text
 fill(255,255,255);
 textSize(currentSize);
 textAlign(CENTER,CENTER);
 textFont(KidsMagazine);
 text("GAME OVER",450,250);
 text("SCORE:"+score,450,400);
 text("HIGHEST:"+bestscore,450,550);
 angle += 0.05;
}
