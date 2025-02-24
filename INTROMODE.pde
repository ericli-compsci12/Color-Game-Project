
//--------------------------------------------------------------
// Intro mode: Displays animated title screen with GIF background
//--------------------------------------------------------------

void INTROMODE () {
 //white background color
 background(255,255,255);
 arrowFont = createFont("SansSerif", 70);
 
 // GIF animation handling
 NumberOfFrames = 30;
 gif = new PImage[NumberOfFrames];
 int i = 0;
 while( i < NumberOfFrames) {
   gif[i] = loadImage("frame_"+i+"_delay-0.03s.gif");
   i++;   
 }
  image(gif[f],0,0,width,height);
 f=f+5;
 if (f == NumberOfFrames) f = 0;

 
 //draw navigation button
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
   
   //draw arrow in navigation button design
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

 // Animated title text
 float currentSize = 60 + 30 * sin(angle);
 KidsMagazine = createFont("Kids Magazine.ttf",currentSize);
 fill(0, 191, 255);
 textSize(currentSize);
 textAlign(CENTER,CENTER);
 textFont(KidsMagazine);
 text("COLOR",450,250);
 text("CATCHER",450,450);
 angle += 0.30;
}
