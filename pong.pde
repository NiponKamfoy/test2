PongBall pongball;
PongGame ponggame;
PongPaddle paddleL, paddleR ;

void setup() {
  background(0);
  size(1200, 600);
  rectMode(CENTER);
  rect(600, 300, 10, height);
  pongball = new PongBall();
  paddleR = new PongPaddle(1200, 300, 50, 200);
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
  if (pongball.positionX < 0 ) {
    pongball.directionX *= -1 ;
  }
  if (pongball.positionY > height || pongball.positionY < 0 ) { // ball bounce with top and bottom edge
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

  paddleR = new PongPaddle(1200, paddleR.positionY, paddleR.width, paddleR.height);
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
    if (scoreL == 5){
      textMode(CENTER);
      text("Player Left win", 300, 300);
      delay(100);
      exit();
    }
    else if (scoreR == 5){
      textMode(CENTER);
      text("Player Right win", 300, 300);
      delay(100);
      exit();
    }
  }

  void serveBall(PongBall pongball) {
    pongball.positionX = 600 ;
    pongball.positionY = 300 ;
    pongball.directionX = 1;
  }
}

class PongBall {
  float positionX, positionY, speed, directionX, directionY;

  PongBall() {
    this.positionX = 600 ;
    this.positionY = 300 ;
    this.speed = 10 ;
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

class PongPaddle {
  float positionX, positionY, width, height;

  PongPaddle(float positionX, float positionY, float sizeX, float sizeY) {
    this.positionX = positionX ;
    this.positionY = positionY; 
    this.width = sizeX;
    this.height = sizeY;
    rect(this.positionX, this.positionY, this.width, this.height);
  } 

  void bounceBall(PongBall pongball) {
    pongball.directionX *= -1.1 ;
  }
}
