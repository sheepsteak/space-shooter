# Space Shooter

Simple side-scrolling shooter written in C with [Raylib](https://raylib.com).

## Development

The project uses [Premake](https://premake.github.io) to generate build files. As an example, to generate a `Makefile` run:

```sh
premake5 gmake2
```

The requested build files will be generated in the `build` directory. The project can then have a debug build generated with:

```sh
make -C build SpaceShooter
```

A release build can be generated with:

```sh
make -C build SpaceShooter config=release
```

## Unit Tests

Follow the steps above to generate build files for the project with Premake. Then, to build the tests and run them do:

```sh
make -C build SpaceShooterTests
./bin/SpaceShooterTests/Debug/SpaceShooterTests
```
