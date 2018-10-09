class Astronauta {
  Body body;
  float x, y;
  float v;
  float w, h;
  PImage image;
 //constructor
  Astronauta(float x_, float y_,float w_, float h_) {
    this.x =x_;
    this.y = y_;
    this.v = 5;
    w = w_;
    h = h_;
    makeBody(new Vec2(x, y), w, h);
  }

void display() {
  Vec2 pos = box2d.getBodyPixelCoord(body);
  float a = body.getAngle();
  rectMode(CENTER);
  pushMatrix();
  translate(pos.x, pos.y);
  imageMode(CENTER);
  image(Astro, mouseX, mouseY);
  popMatrix();
}

    void attract(float x,float y) {
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();

    worldTarget.subLocal(bodyVec);
    worldTarget.normalize();
    worldTarget.mulLocal((float) 60);
    body.applyForce(worldTarget, bodyVec);
  }
  void makeBody(Vec2 center, float w_, float h_) {
    //step 1: define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    //step 2: create body
    body = box2d.createBody(bd);
    //step 3: Create shape
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);
    //step 4: CreateFixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    //paramethers that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    //step 5: Attach Shape to Body with Fixture
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5, 5), random(-5, -5)));
    body.setAngularVelocity(random(-1, 1));
  }
}
