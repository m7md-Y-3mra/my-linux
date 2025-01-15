picom
=======

![](demo.gif)

This is a fork of the pijulius picom with the incredible animations. This is made for OpenBSD users, if you're not using OpenBSD check [pijulius's picom](https://github.com/pijulius).

## Build

### Dependencies

* meson
* ninja
* python
* gcc
* cmake
* xcb
* libconfig (optional, disable with the `-Dconfig_file=false` meson configure flag)
* libev
* uthash

To build the documents, you need `asciidoc`

### To build

```bash
$ git submodule update --init --recursive
$ LDFLAGS="-L/usr/X11R6/lib -L/usr/local/lib" CPPFLAGS="-I/usr/X11R6/include -I/usr/local/include" meson --buildtype=release . build
$ ninja -C build
```

Built binary can be found in `build/src`

### To install

``` bash
$ ninja -C build install
```

Default install prefix is `/usr/local`, you can change it with `meson configure -Dprefix=<path> build`

## How to Contribute

### Code

You can look at the [Projects](https://github.com/yshui/picom/projects) page, and see if there is anything that interests you. Or you can take a look at the [Issues](https://github.com/yshui/picom/issues).

### Non-code

Even if you don't want to contribute code, you can still contribute by compiling and running this branch, and report any issue you can find.

Contributions to the documents and wiki will also be appreciated.

## Contributors

See [CONTRIBUTORS](CONTRIBUTORS)
