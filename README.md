# Space Shooter

Simple side-scrolling shooter written in C with [Raylib](https://raylib.com).

## Development

The project uses [Premake](https://premake.github.io) to generate build files. As an example, to generate a `Makefile` run:

```sh
premake5 gmake2
```

The requested build files will be generated in the `build` directory. The project can then have a debug build generated with:

```sh
make -C build
```

A release build can be generated with:

```sh
make -C build config=release
```
