
class Pantalla {

  void startGame() {
    gameScreen=1;
  }

  void inicio() {
    image(P1, 0, 0);
    if (mousePressed) {
      gameScreen = 1;
    }
  }
  void historia () {
    image(P2, 0, 0);
    if (keyPressed) {
      gameScreen = 2;
    }
  }

  void game() {
    
    pushMatrix();
    translate(2000, 300);
    dx=dx++;
    image(P3, -x, y);
    movimiento_fondo();
    popMatrix();
    /*pushMatrix();
    dt+=0.01;
    noStroke();
    for (int i= 0; i<width; i+=5) {
      for (int j = 0; j<height; j+=5) {
        fill(noise(i*0.01+dt, j*0.01, dt)*255, 20);
        rect(i, j, 10, 10);
      }
    }
    popMatrix();*/
    pushMatrix();
    translate(20, 80);
    popMatrix();
    if (mousePressed) {
      for (Astronauta a : Astronauta) {
        a.attract(mouseX, mouseY);
      }
    }
    if (gameScreen == 2) {
      Astronauta astro = new Astronauta(100, 150,50,50);
      astro.display();
      tiempoTranscurrido = millis()-inicioTiempo;
      if (tiempoTranscurrido >= limiteDeTiempo){
        gameScreen = 3;
      }
      else text (millis()-inicioTiempo,700,100);
    }
  }

  void movimiento_fondo() {
    x= x+v;
    if (x>4000) {
      gameScreen=3;
    }
  }


  void fin() {
    background(0);
    textSize(60);
    textAlign(CENTER);
    text("FIN", 500,300);
  }

  void display() {
    switch (gameScreen) {
    case 0:
      inicio();
      break;
    case 1: 
      historia();
      break;
    case 2:
      game();
      break;
    case 3:
      fin();
      break;
    }
  }
}
