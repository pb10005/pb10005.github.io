import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Collections;

/* constant values */
final int speed = 2;
final float radius = 5;
final int initLife = 100;


List<Particle> particles = new ArrayList<Particle>();//list of particles

void setup(){
  size(600, 600);
  frameRate(30);
}
void draw(){
  background(0);
  List<Particle> rm = new ArrayList<Particle>();
  for(Particle p: particles){
    p.grow();
    Boolean res = p.draw();
    if(!res){
      rm.add(p);
    }
  }
  for(Particle p: rm){
    particles.remove(p);
  }
}
void mouseDragged(){
  Particle p =new Particle(mouseX, mouseY, initLife);
  particles.add(p);
}
class Particle{
  public Particle(float x, float y, int life){
    this.x = x;
    this.y = y;
    this.life = life;
    this.radius = 0;
    setColor(random(255), random(255), random(255));
  }
  float x,y;
  float r,g,b;
  float radius;
  Boolean canGenerate = true;
  int life;
  void grow(){
    radius+= speed;
    life--;
  }
  Boolean draw(){
    if(life <= 0){
      return false;
    }
    stroke(r,g,b);
    fill(0,0,0,0);
    ellipse(x,y,radius,radius);
    return true;
  }
  void setColor(float r, float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
}
