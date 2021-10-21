## Bare Metal UEFI Application (bmua)
A toy UEFI application.

## Setup Example
It is supposed to run on qemu, and the example below is mainly for intel mac.

#### install, setup XQuartz(X11).
```bash
# Install X11 to mac.
$ brew install xquartz

# If DISPLAY environment variable is not set
$ export DISPLAY=:0.0

# Add host for X11.
$ xhost + 127.0.0.1

```

⚠️**NOTE1.** macに初めてinstallした場合は、xquartsの「セキュリティ」設定を下記のように設定していないと失敗する

<img width="425" alt="スクリーンショット 2021-10-22 3 33 15" src="https://user-images.githubusercontent.com/55653825/138336584-24fab510-63b2-452c-81b9-6e6b92bcacc5.png">

⚠️**NOTE2.**`DISPLAY`環境変数が設定されていないと、`xhost + ...`が失敗するので、
```bash
$ export DISPLAY=:0.0
```
などとして、適当な値で設定しておく.

#### Clone code, and enter the docker container.

```bash

$ git clone https://github.com/mox692/bmua && cd bmua

$ make build && make run
```

#### Inside container, build C source and run qemu.
```bash

# build C source
$ ~/bmua# make build


# create disk image
$ ~/bmua# make img

# run qemu
$ ~/bmua# make run
```
<img width="813" alt="スクリーンショット 2021-10-21 20 52 15" src="https://user-images.githubusercontent.com/55653825/138272373-4224d0f8-3117-4696-9d57-754f05f5e20d.png">

## Ref
* http://yuma.ohgami.jp/UEFI-Bare-Metal-Programming/index.html
