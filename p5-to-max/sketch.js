// we need a handle to the socket to send our osc values
var socket;
var isConnected;

let squares = [];

var x, y;

function setup() {
  createCanvas(400, 400);
  for (let i = 0; i < 24; i++) {
    let w = new Walker(200, 200);
    squares.push(w);
  }
  setupOsc(12000, 3334); // port in, port out
}

function draw() {
  background(220);

  for (let i = 0; i < squares.length; i++) {
    squares[i].steer();
    squares[i].move();
    squares[i].check();
    squares[i].show();
    squares[i].send(i);
  }
}

// JS Object
class Walker {
  constructor(x, y) {
    this.pos = createVector(x, y);
    this.w = random(5, 30);
    this.speed = this.w / 60;
    this.vel = createVector(0.1, -0.1); // velocity
  }
  steer() {
    let xacc = random(-this.speed, this.speed);
    let yacc = random(-this.speed, this.speed);
    let accel = createVector(xacc, yacc);
    this.vel.add(accel);
    this.vel.limit(5);
  }
  move() {
    this.pos.add(this.vel);
  }
  show() {
    square(this.pos.x, this.pos.y, this.w);
  }
  send(i) {
    sendOsc("message", [i, this.pos.x, this.pos.y]);
  }
  check() {
    if (this.pos.x > width) {
      this.pos.x = 0;
    }
    if (this.pos.x < 0) {
      this.pos.x = width;
    }
    if (this.pos.y < 0) {
      this.pos.y = height;
    }
    if (this.pos.y > height) {
      this.pos.y = 0;
    }
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
