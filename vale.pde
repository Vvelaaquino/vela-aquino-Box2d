//valeria(diversion)

import processing.sound.*;
SoundFile file;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
PImage fondo;
PImage tramp;
PImage nina;
int pantalla;
int intro;
int juego;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;
ArrayList<particula> particulas;

void setup() {
  size(640,360);
  smooth();
   
 nina = loadImage("niña1.png");
 fondo = loadImage("fondo1.jpg");
 tramp = loadImage("tramp.png");
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  file = new SoundFile(this,"cfondo.mp3");
  file.play();
  file.amp(0.5);
  
  particulas = new ArrayList<particula>();
  boundaries = new ArrayList<Boundary>();
  
  boundaries.add(new Boundary(width/2,height -355,width -5,10));
  boundaries.add(new Boundary(width/4,height/3.1,width -5,10)); //
  boundaries.add(new Boundary(width-5,height/2,10,height));
  boundaries.add(new Boundary(5,height/2,10,height));
}

void draw() {
background(255);

pushMatrix();
noStroke();

//image(nina,0,0,0,0);
popMatrix();

pushMatrix();
scale(1);
noStroke();
  image(fondo,0,0,640,360);
  popMatrix(); 

image(tramp,50,200,550,140);
box2d.step();
   
  box2d.step();
  if (mousePressed) {
    particula p = new particula(mouseX,mouseY);
    particulas.add(p);
    file = new SoundFile(this,"risa.mp3");
  file.play();
  file.amp(2);
    
    mousePressed = false;
  }
  
  for (Boundary wall: boundaries) {
    wall.display();
  }
  
  for (particula f: particulas) {
    f.display();
  }
  
  for (int i = particulas.size()-1; i >= 0; i--) {
    particula b = particulas.get(i);
    if (b.done()) {
      particulas.remove(i);
    }
  }
  
  fill(0);
  text("Click en la pantalla",210,80);

}
