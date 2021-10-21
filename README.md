## Bare Metal UEFI Application (bmua)
A toy UEFI application.

## Setup Example
For intel mac example.

install XQuartz(X11).
```
$ brew install xquartz
```


Add host for X11.
```
$ xhost + 127.0.0.1
```

Clone code, and enter the docker container.
```
$ git clone https://github.com/mox692/bmua && cd bmua

$ make build && make run
```

Inside container, build C source and run qemu.
```
$ make build

$ make img

$ make run
```

## Ref
* http://yuma.ohgami.jp/UEFI-Bare-Metal-Programming/index.html