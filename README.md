# aoc_get
Gets the input for a given day

build with `odin build .`

run with `./aoc_get.exe <your session token> <day> [year]`

pipe stdout to the file of your choice to have your input

will default to 2023 if you don't specify year

## Dependencies:
* [odin-http](https://github.com/laytan/odin-http) - place in your odin `shared` directory
* OpenSSL - you'll need that installed on your machine, odin-http provides .libs for windows/mac to find the .dlls
