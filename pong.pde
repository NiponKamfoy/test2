PongBall pongball;
PongPaddle_Left paddleL;
PongPaddle_Right paddleR;
PongGame ponggame;

void setup() {
  background(0);
  size(1200, 600);
  rectMode(CENTER);
  rect(600, 300, 10, height);
  pongball = new PongBall();
  paddleL = new PongPaddle_Left(300, 50, 200) ;
  paddleR = new PongPaddle_Right(300, 50, 200) ;
  ponggame = new PongGame();
}

void draw() {

  background(0);
  rect(600, 300, 10, height);
  pongball.move();

  if (pongball.positionX > (paddleR.positionX - paddleR.width) && pongball.positionY < (paddleR.positionY + paddleR.height/2) &&  //ball bounce with paddle
    pongball.positionY > (paddleR.positionY - paddleR.height/2)) {
    paddleR.bounceBall(pongball) ;
  }
  if (pongball.positionX < (paddleL.positionX + paddleR.width) && pongball.positionY < (paddleL.positionY + paddleL.height/2) && 
    pongball.positionY > (paddleL.positionY - paddleL.height/2)) {
    paddleL.bounceBall(pongball) ;
  }
  if (pongball.positionY > height || pongball.positionY < 0) { // ball bounce with top and bottom edge
    pongball.directionY *= -1 ;
  }

  if (mousePressed == true) {   // mouse pressed to drag a paddle
    if (mouseX < 600) {
      paddleL.positionY = mouseY ;
    }      
    if (mouseX > 600) {
      paddleR.positionY = mouseY ;
    }
  }
  
  if (pongball.positionX > width){
    ponggame.scoreL += 1 ;
    ponggame.serveBall(pongball);
  }
  else if (pongball.positionX < 0){
    ponggame.scoreR += 1;
    ponggame.serveBall(pongball);
  }
  
  rect(paddleR.positionX, paddleR.positionY, paddleR.width, paddleR.height);
  rect(paddleL.positionX, paddleL.positionY, paddleL.width, paddleL.height);
  ponggame.update();
}


class PongGame {
  int scoreL, scoreR ;
  PongGame(){
    scoreL = 0;
    scoreR = 0;
  }

  void update() {
    textSize(70);
    textMode(CENTER);
    text(scoreL, 300, 80);
    text(scoreR, 900, 80);
  }

  void serveBall(PongBall pongball) {
    pongball.positionX = 600 ;
    pongball.positionY = 300 ;
  }
}

class PongBall {
  float positionX, positionY, speed, directionX, directionY;

  PongBall() {
    this.positionX = 600 ;
    this.positionY = 300 ;
    this.speed = 5 ;
    this.directionX = 1 ;
    this.directionY = 1 ;
    circle(this.positionX, this.positionY, 50);
  }

  void move() {
    this.positionX += speed * directionX ;
    this.positionY += speed * directionY ;
    circle(this.positionX, this.positionY, 50);
  }
}

class PongPaddle_Left {
  float positionX, positionY, width, height;

  PongPaddle_Left(float positionY, float sizeX, float sizeY) {
    this.positionX = 0 ;
    this.positionY = positionY;
    this.width = sizeX;
    this.height = sizeY;
    rect(this.positionX, this.positionY, this.width, this.height);
  } 

  void bounceBall(PongBall pongball) {
    pongball.directionX *= -1 ;
  }
}

class PongPaddle_Right {
  float positionX, positionY, width, height;

  PongPaddle_Right(float positionY, float sizeX, float sizeY) {
    this.positionX = 1200 ;
    this.positionY = positionY; 
    this.width = sizeX;
    this.height = sizeY;
    rect(this.positionX, this.positionY, this.width, this.height);
  } 

  void bounceBall(PongBall pongball) {
    pongball.directionX *= -1 ;
  }
}
