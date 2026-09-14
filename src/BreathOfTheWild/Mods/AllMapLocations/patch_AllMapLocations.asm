[BotW_AllMapLocations_V208]
moduleMatches = 0x6267BFD0

.origin = codecave

_DungeonAlwaysVisible:
lwz r12, 0x2C(r3)
ori r12, r12, 0x80
stw r12, 0x2C(r3)
blr

; Dungeon is LocationMarker icon type 2. Override only its visibility thunk;
; discovery, completion, and warp checks continue to use the original flags.
0x02E93DF0 = ba _DungeonAlwaysVisible

; Both Korok map modes read the entry's real flag before hiding the icon.
; Keep that read intact and only bypass the false-result hide branches.
0x02E97728 = nop
0x02E977BC = nop

