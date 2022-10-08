# SwiftWasmPuzzle

This project is an experimental project consisting of an iOS app and a web app written in Swift code and sharing business logic by WebAssembly technology provided by [SwiftWasam Project](https://swiftwasm.org/).

## iOS App

To run the app, open `SwiftWasmPuzzle.xcworkspace`, build and run `SwiftWasmPuzzleApp` scheme.

## Web App

This project requires [carton](https://github.com/swiftwasm/carton). You need to insall it before running the web app.

```sh
$ cd ./SwiftWasmPuzzle
$ carton dev # To build and run the app locally
$ carton bundle # To build the app for distribution
```
