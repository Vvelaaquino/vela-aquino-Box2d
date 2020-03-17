
class particula {

  Body body;
  float w;
  float h;

  particula(float x, float y) {
    w = 5;
    h = w;
    makeBody(new Vec2(x,y),w,h);
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
 
  boolean done() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    if (pos.y > width+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  void attract(float x,float y) {
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    worldTarget.subLocal(bodyVec);
    worldTarget.mulLocal((float) 50);
    body.applyForce(worldTarget, bodyVec);
  }
 
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    scale(.35);
    image(nina,0,0);
    popMatrix();
  }
 
  void makeBody(Vec2 center, float w_, float h_) {

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef mg = new FixtureDef();
    mg.shape = sd;
    mg.density = 1;
    mg.friction = 0.3;
    mg.restitution = 0.5;

    BodyDef mi = new BodyDef();
    mi.type = BodyType.DYNAMIC;
    mi.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(mi);
    body.createFixture (sd,-4.0);
    body.setAngularVelocity(random(1000,1000));

  }
}
