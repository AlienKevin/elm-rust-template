import * as wasm from "elm_rust_template";
import "./elm.js"

var app = Elm.Main.init({ node: document.querySelector('main') });
app.ports.calculateFibonacci.subscribe(function(nth) {
  app.ports.receiveFibonacci.send(wasm.fibonacci(nth));
});
