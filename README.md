# bevy_webgl2

## Running examples
```
./build_example.sh <name of example>
```
then serve the `bevy-showcase` dir with some webserver  
and visit `localhost:<port>/index.html?example=<example>`

example:
```
./build_example.sh sprite
simple-http-server bevy-showcase/
```
and visit [http://localhost:8000/index.html?example=sprite](http://localhost:8000/index.html?example=sprite)
