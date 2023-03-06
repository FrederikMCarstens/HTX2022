
// import af biblioteket
import controlP5.*;

//deklaration af variablen cp5 til type ControlP5
ControlP5 cp5;

//deklaration af variablen textfield og button1 til typerne Textfield og Button 
Textfield textfield;
Button button1;

float number = 0.0;

void setup() {
  size(500, 300);
  // vi vælger en font som skrifttype
  PFont font = createFont("arial", 24);

  // Kontakt til ConptrolP5 Biblioteket - initieringen
  cp5 = new ControlP5(this);

  // Tekst-feltet hvor tallet skal indtastes
  // initiering af textfield
  textfield=cp5.addTextfield("input");
  // nu sætter vi alle attributter for objektet ved brug af set
  textfield.setPosition(50, 80)
    .setSize(150, 50)
    .setFont(font)
    .setColor(color(255))
    .setColorCursor(color(255))
    .setAutoClear(false)
    .setLabel("")
    ;

  // Knappen der er knyttet til funktionen generate()
  // initiering af button1, bemærk vi binder en funktion til knappen. Hvis der trykkes på den skal den køre funktionen generate
  button1=cp5.addButton("generate");
  // nu sætter vi alle attributter for objektet ved brug af set
  button1.setPosition(230, 85)
    .setSize(180, 40)
    .setLabel("Læs tallet")
    .setFont(font)
    ;
  // set font = skrittype
  textFont(font);
}

void draw() {
  background(0, 151, 156);
  fill(255);
  
  // validering af inputdata
  if (Float.isNaN(number)) {
    text("Tallet er indtastet forkert", 50, 200);
  } else {
    text(number, 50, 200);
  }
}

// Se linje 37, hvis der trykke på knappe aktiveres programmet 
public void generate() {
  // Tallet hentes som en tekststreng i tekst-feltet input
  String input = cp5.get(Textfield.class, "input").getText(); // hent det som står i tekstfeltet
  input = input.replace(',', '.');  // Accepter dansk komma
  number = float(input); // konverter tallet til et float
  textfield.clear(); // sletter tallet
}
