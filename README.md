# elm-rust-template

A convenient template for combining Elm and Rust in the front end.

# Set up
## The Rust Toolchain
You will need the standard Rust toolchain, including rustup, rustc, and cargo.

[Follow these instructions to install the Rust toolchain.](https://www.rust-lang.org/tools/install)

## wasm-pack
wasm-pack is your one-stop shop for building, testing, and publishing Rust-generated WebAssembly.

[Get wasm-pack here!](https://rustwasm.github.io/wasm-pack/installer/)

## cargo-generate
cargo-generate helps you get up and running quickly with a new Rust project by leveraging a pre-existing git repository as a template.

Install cargo-generate with this command:
```
cargo install cargo-generate
```

## npm
npm is a package manager for JavaScript. We will use it to install and run a JavaScript bundler and development server. At the end of the tutorial, we will publish our compiled .wasm to the npm registry.

[Follow these instructions to install npm.](https://www.npmjs.com/get-npm)

If you already have npm installed, make sure it is up to date with this command:

```
npm install npm@latest -g
```

# Usage

## Clone this template
```
cargo generate --git https://github.com/AlienKevin/elm-rust-template
```
This should prompt you for the new project's name.

## Build Rust into WebAssembly
In the project root:
```
wasm-pack build
```

## Install web dependencies
First, you need to be in the `www` directory:
```
cd www
```
Then install all npm dependencies:
```
npm install
```

## Serve locally for development
In the `www` directory.

Watch for Elm file changes:
```
npm run watch
```
Open another terminal and spin up a dev server using webpack:
```
npm run start
```
Navigate your Web browser to http://localhost:8080/ and you should see the default page.

Anytime you make changes and want them reflected on http://localhost:8080/, just **re-run** the `wasm-pack build` command within the root directory.

## Deploy for a new release
In the root directory.

Create an optimized release build from Rust to WebAssembly.
```
wasm-pack build --release
```
In the `www` directory.

Bundle, optimize, and minimize all JavaScript and Elm for smaller asset size and faster speed.
```
npm run build
```
Now you should see a `dist` folder within `www` similar to this:
```
www
├── ...
├── dist
    ├── 0.bootstrap.js
    ├── 1.bootstrap.js
    ├── 27911fde1b082c3d4.module.wasm
    ├── bootstrap.js
    ├── index.html
├── ...
```

## Publish to Github Pages
Follow all the previous steps outlined in deployment instructions. Then push the `www/dist` folder to the `gh-pages` branch on GitHub.
```
git subtree push --prefix www/dist origin gh-pages
```

# Examples using elm-rust-template
[Hack Assembler](https://github.com/AlienKevin/hack-assembler-web): An assembler for the Hack assembly language

# Credits
Template and README adapted from [The Rust and Wasm Book](https://rustwasm.github.io/docs/book/introduction.html). Github Pages deployment instruction from [gh-pages-deploy](https://gist.github.com/cobyism/4730490)

# License
MIT