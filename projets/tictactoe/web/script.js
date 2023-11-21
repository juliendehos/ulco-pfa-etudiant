
function myPrintLn(str) {
  document.getElementById("myDiv").innerHTML += "<br>" + str;
}

function myPrint(str) {
  document.getElementById("myDiv").innerHTML += " " + str;
}

function fmtCell(cell) {
  // TODO fmtCell
}

function fmtGame(game) {
  // TODO fmtGame
}

const socket = new WebSocket("ws://localhost:9000");

socket.onopen = function () {
  myPrintLn("connected");
};

socket.onmessage = function(event) {
  // TODO onmessage
  console.log(event.data);
};

socket.onclose = function(event) {
  myPrintLn(`closed`);
};

socket.onerror = function(event) {
  console.log(`socket error: ${event.message}`);
};

function handleSend() {
  // TODO handleSend
}

const sendButton = document.getElementById("sendButton");
sendButton.disabled = true;
sendButton.addEventListener("click", handleSend);

