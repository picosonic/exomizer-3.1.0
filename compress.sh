#!/bin/bash

# -c required when LITERAL_SEQUENCES_NOT_USED = 1
# -M256 required when MAX_SEQUENCE_LENGTH_256 = 1
# -P+16 required when EXTRA_TABLE_ENTRY_FOR_LENGTH_THREE = 1
# -P-32 required when DONT_REUSE_OFFSET = 1
# -f required when DECRUNCH_FORWARDS = 1

./exomizer level -M256 -P+16-32 -c 3DTUT@0x0000 -o XSCR
