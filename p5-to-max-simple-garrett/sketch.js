// we need a handle to the socket to send our osc values
var socket;
var isConnected;

let noiseScale = 100;

let particles = [];
let numParticles = 10;
let font;
let sz = 200;
let spd = 0.1;
let count = 0;

function setup() {
  createCanvas(400, 400);

  setupOsc(12000, 3334); // port in, port out
  for (var i = 0; i < numParticles; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

function draw() {
  background("white");

  for (i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].display();

    particles[i].send(i);
  }
}

function mouseDragged() {
  let b = new Particle(mouseX, mouseY);
  particles.push(b);
}

class Particle {
  constructor(x, y) {
    this.pos = createVector(x, y);
    this.dir = createVector(0, 0);
    this.speed = spd;
    this.color = random(255);
    this.r = 3;
    this.alpha = 255;
  }
  move() {
    let angle =
      noise(this.pos.x / noiseScale, this.pos.y / noiseScale) * TWO_PI;
    this.dir.x = sin(angle);
    this.dir.y = cos(angle);
    this.dir.mult(this.speed);
    this.pos.add(this.dir);
  }
  display() {
    fill(this.color, this.alpha);
    circle(this.pos.x, this.pos.y, this.r);
  }

  send(i) {
    sendOsc("message", [i, this.pos.x, this.pos.y]);
  }
}

function sendOsc(address, value) {
  if (isConnected) {
    socket.emit("message", [address, value]);
  }
}

function setupOsc(oscPortIn, oscPortOut) {
  socket = io.connect("http://127.0.0.1:8081", {
    port: 8081,
    rememberTransport: false,
  });
  socket.on("connect", function () {
    socket.emit("config", {
      server: { port: oscPortIn, host: "127.0.0.1" },
      client: { port: oscPortOut, host: "127.0.0.1" },
    });
  });
  socket.on("connect", function () {
    isConnected = true;
  });
  socket.on("message", function (msg) {
    if (msg[0] == "#bundle") {
      for (var i = 2; i < msg.length; i++) {
        receiveOsc(msg[i][0], msg[i].splice(1));
      }
    } else {
      receiveOsc(msg[0], msg.splice(1));
    }
  });
}
