
// queste sono variabili globali, con SCOPO GLOBALE, e possono essere lette su tutta la lunghezza del codice
int w = 16; 
int h = 16; 
int index = 0;

void setup() { // funzione che si chiama configurazione
  size(640, 384);
  background(#0000ff);
  smooth(); // 8 di default, ma si può definire valore
} //setup

void draw() { // funzione che si chiama disegno
  // queste sono variabili con SCOPO che finisce con draw. Non esistono fuori da draw
  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*23;
  int y2 = h*24;

  if (key == 'o') {
    stroke(224);
    strokeWeight(3);
    if (random(2) < 1) {    
      line(x2, y1, x1, y2);
    } else {
      line(x1, y1, x2, y2);
    }
  } else  if (key == 'c') {
    stroke(#0000ff);
    int x3 = (w*index)+(w/2);
    int y3 = (h*23)+(h/2);
    fill(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(0);
    ellipse(x3, y3, 16, 16);
  } else {
    if (random(2) < 1) {
      stroke((random(0, 255)), (random(0, 255)), (random(0, 255)));
      strokeWeight(3);
      line(x2, y1, x1, y2);
    } else {
      line(x1, y1, x2, y2);
    }
  }
  
  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*23); // costruisce un'img (PImage) prendendo (get) solo una parte dello schermo (0, h, width, h*23)
    background(#0000ff); // in questo caso significa "cancella il background con sfondo di colore #0000ff"
    set(0, 0, p); // lo "butta", come fosse un secchio. Lo prende con get e lo riproduce con set
    index = 0;
  }
} //draw