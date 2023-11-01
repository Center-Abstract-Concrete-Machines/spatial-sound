// we need a handle to the socket to send our osc values
var socket;
var isConnected;

let squares = [];

function setup() {
  createCanvas(400, 400);
  setupOsc(12000, 3334); // port in, port out
}

function draw() {
  background(220);
  let x = mouseX;
  let y = mouseY;
  ellipse(x, y, 40, 40);
  sendOsc("message", [0, x, y]); /// index number, x, y

  ellipse(100, 100, 40, 40);
  sendOsc("message", [1, 200, 200]); /// index number, x, y
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
