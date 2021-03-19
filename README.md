# exomizer-3.1.0
Demo of using exomizer v3.1.0 decompression on the BBC Micro using 6502 assembler

This demo loads a fullscreen Mode 0 image into screen memory decompressing as it goes. The picture was drawn by myself in the late 80s on a BBC Micro using Wapping Editor and a Quest mouse.

![3D Tutankhamun](3dtut.png?raw=true "3D Tutankhamun")

## Adding the decruncher to your 6502 asm project

In your 6502 asm project, add this to your zeropage variables:

```
include "exomizer302decruncher.h.asm"
```

And this anywhere in your code:

```
include "exomizer302decruncher.asm"

.my_crunched_data
INCBIN "mycruncheddata.exo"
```

### Important

This decruncher is hardcoded to use the bottom of the stack (&0100-&01A0, rounded up) as workspace while decompressing data. This is easily changed by modifying `decrunch_table`.

## Preparing compressed data

Download [Exomizer v3.1.0](https://bitbucket.org/magli143/exomizer/wiki/Home) and compress your data, with command line options in compress.sh. e.g.:

```
exomizer level -M256 -P-32 -c mydata.bin@0x0000 -o mycruncheddata.exo
```

## Decrunching data in your 6502 asm project

```
ldx #lo(my_crunched_data)
ldy #hi(my_crunched_data)
lda #hi(&5800) ; destination for decompressed data, only hi byte needed (page)
jsr decrunch_to_page_A
```

## Acknowledgements

[Exomizer](https://bitbucket.org/magli143/exomizer/wiki/Home) is created by Magnus Lind, with changes to allow assembling with beebasm.

With help from [0xC0DE6502](https://github.com/0xC0DE6502/6502-asm-experiments/tree/master/exomizer-3.02-decruncher)
