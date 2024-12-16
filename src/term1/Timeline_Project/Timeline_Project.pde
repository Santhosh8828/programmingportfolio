// Santhosh Ramanathan | Timeline Project | 28 Aug 24

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(20, 100, 200);
  fill(255, 0, 0);
  drawRef();
  histEvent(120, 200, "Zuse Z3", "It was completed in May 1941, It was created by Konrad Zuse \n The computer solved wing flutter problems said by an aerodynamics engineer  ", true);
  histEvent(180, 300, "ABC", "It was first operated in 1942 \n The computer was invented by John Vincent Atanasoff \n It was considered that it was the first electronical ALU ", false);
  histEvent(320, 200, "Colossus Mark 1", " Used to crack codes sent in Germany so people can find out what was Germany's plans \n It was finished in the year of February 1944\n It was was made by Tommy flowers and his assistants", true);
  histEvent(430, 300, "Zuse Z4", "It was made by Konrade Zuse and was finished in March 1945. \n It was also used at ETH Zurich from 1950 to 1955 \n It inspired the construction of the EMRETH the first swiss computer", false);
  histEvent(430, 200, "ENIAC", "It was made by  John Mauchly and J. Presper Eckert and was finished by Decemeber 1945 \n It was used for calculating  artillery firing tables for the United States Army", true);
  histEvent(640, 300, "Manchester baby", "Was created in June 1948 and was made in Manchester \n It was the first ever elctronic stored program computer.", false);
  histEvent(740, 200, "EDSAC", " Maurice Wilkes and his team created the EDSAC. \n It was released in May 1949 and made in England.\n It was the second electronic digital stored program computer to go into a regular device", true);
  histEvent(740, 300, "CSIRAC ", "It is Australia's first digital computer \n it also was the first computer in the world to play digital music \n It was created by a team led by Trevor Pearcey and Maston Beard in November 1949", false);
}
void drawRef() {
  // timeline format
  strokeWeight(3);
  stroke(0);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 90, 260);
  text("1950", 810, 260);


  // title text
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(25);
  text("by Santhosh Ramanathan", width/2, 85);
}


void histEvent(int x, int y, String title, String detail, boolean top) {
  if (top == true) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  rectMode(CENTER);
  fill(0, 255, 0);
  rect(x, y, 100, 20, 8);
  fill(255, 0, 0);
  textSize(15);
  text(title, x, y);
  if (mouseX>x-50 && mouseX<x+50 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
