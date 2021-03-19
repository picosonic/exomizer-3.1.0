; -------------------------------------------------------------------
; Controls if the shared get_bits routines should be inlined or not.
INLINE_GET_BITS=1
; -------------------------------------------------------------------
; if literal sequences is not used (the data was crunched with the -c
; flag) then the following line can be uncommented for shorter and.
; slightly faster code.
LITERAL_SEQUENCES_NOT_USED = 1
; -------------------------------------------------------------------
; if the sequence length is limited to 256 (the data was crunched with
; the -M256 flag) then the following line can be uncommented for
; shorter and slightly faster code.
MAX_SEQUENCE_LENGTH_256 = 1
; -------------------------------------------------------------------
; if sequence offsets are not reused (the data was crunched with the
; -P-32 flag) then the following line must be uncommented. Uncommenting the
; line will also result in shorter and slightly faster code.
DONT_REUSE_OFFSET = 1

; -------------------------------------------------------------------
; zero page addresses used
; -------------------------------------------------------------------
.exo_zp_start

.zp_len_lo      skip 1
.zp_len_hi      skip 1

.zp_src_lo      skip 1
.zp_src_hi      skip 1

.zp_bits_hi     skip 1
IF DONT_REUSE_OFFSET=0
.zp_ro_state    skip 1
ENDIF

.zp_bitbuf      skip 1
.zp_dest_lo     skip 1      ; dest addr lo - must come after zp_bitbuf
.zp_dest_hi     skip 1      ; dest addr hi

.get_crunched_byte
skip 1                      ; LDA abs
.INPOS          skip 2      ; &FFFF
.get_crunched_byte_code
skip 7                      ; inc INPOS: bne no_carry: inc INPOS+1: .no_carry RTS
.get_crunched_byte_code_end