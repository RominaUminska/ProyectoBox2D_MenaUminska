import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import processing.sound.*;

Astronauta astronauta;
PImage P1;
PImage P2;
PImage P3;
PImage Astro;
SoundFile musicainicio;
int gameScreen;
float dt;
int v = 5;
int v2= -5;
float dx;
float x, y;
int inicioTiempo;
int tiempoTranscurrido;
int limiteDeTiempo = 20000;
PFont fuente;

ArrayList<Astronauta> Astronauta;
Box2DProcessing box2d;


void setup() {
  size(800, 600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);  
  P1 = loadImage("INICIO.jpg");
  P2 = loadImage("HISTORIA.jpg");
  P3 = loadImage("FONDO-LARGO.jpg");
  Astro = loadImage("astronauta.png");
  inicio = new Pantalla();
  Astronauta = new ArrayList<Astronauta>();
  musicainicio = new SoundFile(this, "space_song.mp3");
  musicainicio.play();
  fuente = createFont("Arial",50);

}

void draw() {
  inicio.display();
  box2d.step();

}
Pantalla inicio;
Pantalla historia;
Pantalla game;
Astronauta astro;

//////////////////astronautajdash
