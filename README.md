# Mach-O segment dumper

Written by Patrick Lindenberg & AlexDenisov based on:
https://lowlevelbits.org/parsing-mach-o-files/

## Prelude

Simple Mach-O header parser for Darwin (macOS X) which dumps some basic information 
mainly to identify the architecture of the binary.

## 1 Installation

### 1.1 Compile sources and install
In order to build and install you have to setup **Xcode** because it needs a C compiler. 

To compile and install you have to call the following make target:

    `sudo make install`

Root is needed because it installs to: `/usr/local/bin` and be sure this directory
is in your `$PATH` variable.

If you just want to compile: 
    
    `make all`.


### 1.2 Install release

If you don't want to compile you can download the latest release and install/use it 
on your own.

## 2 Usage

To dump a binaries header just call:
    
    `modump <path to mach-o binary>` 

Or if you want to dump some executable which is in your path:

    `modump $(which <mach-o binary>)`

The generated output should look something like this:

    `   file        : /bin/ls
        id          : 0xbebafeca
        header type : fat

        0x004000 x86_64:
            segment #00 at 00000000: __PAGEZERO
            segment #01 at 00000000: __TEXT
            segment #02 at 0x008000: __DATA
            segment #03 at 0x00c000: __LINKEDIT

        0x014000 arm64/M1:
            segment #00 at 00000000: __PAGEZERO
            segment #01 at 00000000: __TEXT
            segment #02 at 0x008000: __DATA_CONST
            segment #03 at 0x00c000: __DATA
            segment #04 at 0x010000: __LINKEDIT
`

Fat binaries, which have been compiled for multiple CPUs, always containing two section, each for it's corresponding architecture. 
