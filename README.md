# elm-rust-template

A convenient template for creating a progressive web app using Elm and Rust.

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

## cargo-watch
cargo-watch allows you to watch for code changes in Rust.

Install cargo-watch with this command:
```
cargo install cargo-watch
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
cargo watch -i "pkg/*" -s "wasm-pack build"
```
This should continuously watch for Rust code changes and compile the new version into WebAssembly.

## Install web dependencies
Open another terminal and navigate to the `www` directory:
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
Open another terminal, navigate to `www`
```
cd www
```
and spin up a dev server using webpack:
```
npm run start
```
Navigate your Web browser to http://localhost:8080/ and you should see the default page.

All new changes will be automatically reflected on http://localhost:8080/.

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
    ├── 1.bootstrap.js
    ├── 27911fde1b082c3d4.module.wasm
    ├── bootstrap.js
    ├── index.html
    ├── ...
├── ...
```
This template uses set all build processes to production mode so all assets including JavaScript and WebAssembly are optimized and minimized. 

## Publish to Github Pages
Follow all the previous steps outlined in deployment instructions. Then push the `www/dist` folder to the `gh-pages` branch on GitHub.
```
git subtree push --prefix www/dist origin gh-pages
```

## Customization
### Logos
This template by defaults uses the a combination of ico and png files to provide best logo resolutions for all popular platforms. Included logo files are:

```
www
  ├── android-chrome-192x192.png
  ├── android-chrome-512x512.png
  ├── apple-touch-icon.png
  ├── favicon-16x16.png
  ├── favicon-32x32.png
  ├── favicon.ico
```
To customize the logo used, go to https://favicon.io/ and generate your own logo files from text, image, or emoji. You are also welcome to user other logo generation tools but I found favicon.io easy and fast. Once you have the 6 files listed above, simply replace the originals and no further configurations are needed.

### Theme color and background color
Theme color specifies the color of the browser address bar. Background colors specifies the background color of the splash screen when the browser tries to load your app. You can change both of them in `www/manifest.json`:
```json
{
  ...
  "theme_color": "#f74c00",
  "background_color": "#ffffff"
}
```
You should also change the `theme-color` meta-tag in the `<head>` of `www/index.html` to match the value specified in `www/manifest.json`:
```html
<meta name="theme-color" content="#f74c00">
```

# Porting existing Elm apps
Currently there are no automated way but it's still very easy.

1. Copy all your Elm files into the `www/src` directory
2. Modify the `www/index.html` and `www/index.js` to configure ports and HTML layouts.
3. No step 3 because you are all set now. Just follow the above steps in building and shipping your project.

# Examples using elm-rust-template
[Hack Assembler](https://github.com/AlienKevin/hack-assembler-web): An assembler for the Hack assembly language

# Credits
Template and README adapted from [The Rust and Wasm Book](https://rustwasm.github.io/docs/book/introduction.html). Github Pages deployment instruction from [gh-pages-deploy](https://gist.github.com/cobyism/4730490)

# License
MIT