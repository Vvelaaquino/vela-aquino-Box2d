

class Boundary {

  float x;
  float y;
  float w;
  float h;
  
 Body m;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef mi = new BodyDef();
    mi.type = BodyType.STATIC;
    mi.position.set(box2d.coordPixelsToWorld(x,y));
    m = box2d.createBody(mi);
    m.createFixture(sd,0);
  }

  void display() {
    fill(8, 54, 169,0);
    noStroke();
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}
