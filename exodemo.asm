; OS defines
INCLUDE "os.asm"

; Zero page vars
ORG &50

include "exomizer310decruncher.h.asm"

ORG &1200

.start

  ; Entry point
  JSR exo_demo

.infinite_loop
  JSR infinite_loop

  ; Back to OS
  RTS

.exo_demo
{
  ; Mode 0 (640x256, 0 colours)
  LDA #&16:JSR OSWRCH
  LDA #&00:JSR OSWRCH

  ; Hide the cursor, with cursor start register (in scanlines)
  LDA #&0A:STA CRTC00
  LDA #&20:STA CRTC01


  LDX #lo(xscr)
  LDY #hi(xscr)
  LDA #hi(MODE0BASE)

  jsr decrunch_to_page_A

  RTS
}

include "exomizer310decruncher.asm"

.xscr
INCBIN "XSCR"
.end

SAVE "exo", start, end