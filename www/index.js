import * as wasm from "{{project-name}}";
import "./elm.js"

var app = Elm.Main.init({ node: document.querySelector('main') });
app.ports.calculateFibonacci.subscribe(function(nth) {
  app.ports.receiveFibonacci.send(wasm.fibonacci(nth));
});

if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('./sw.js').then(registration => {
      console.log('SW registered: ', registration);
    }).catch(registrationError => {
      console.log('SW registration failed: ', registrationError);
    });
  });
}
