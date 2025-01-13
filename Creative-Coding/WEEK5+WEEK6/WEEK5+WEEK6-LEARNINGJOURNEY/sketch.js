const Engine = Matter.Engine;
const World = Matter.World;
const Bodies = Matter.Bodies;
const Body = Matter.Body;

let engine;
let world;
let ground;
let ball;

function setup() {
  createCanvas(400, 400);

  // Create physics engine and world
  engine = Engine.create();
  world = engine.world;

  // Create static ground
  let groundOptions = {
    isStatic: true,
  };
  ground = Bodies.rectangle(200, 390, 400, 20, groundOptions);
  World.add(world, ground);

  // Create a bouncing ball
  let ballOptions = {
    restitution: 0.8, // Makes the ball bouncy
  };
  ball = Bodies.circle(200, 50, 20, ballOptions);
  World.add(world, ball);

  rectMode(CENTER);
  ellipseMode(RADIUS);
}

function draw() {
  background('yellow');
  Engine.update(engine);

  
  // Draw ball
  fill('red');
  ellipse(ball.position.x, ball.position.y, 50);
}

function keyPressed() {
  if (keyCode === UP_ARROW) {
    // Apply an upward force to the ball
    Matter.Body.applyForce(ball, { x: 0, y: 0 }, { x: 0, y: -0.05 });
  }
}
