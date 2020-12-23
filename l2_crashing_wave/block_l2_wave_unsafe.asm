db $42 ; or db $37
JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH : JMP MarioCape : JMP MarioFireball
JMP TopCorner : JMP BodyInside : JMP HeadInside
; JMP WallFeet : JMP WallBody ; when using db $37

!RAM_FreeRAM = $1AF8|!addr ; Item Memory Index 2 Table

;; Do not change if you don't know what you are doing
!Wave_PlayerSafe = !RAM_FreeRAM+7 ; 1byte
!Wave_SpriteSafe = !RAM_FreeRAM+8 ; 15 bytes (21 for SA-1)

MarioBelow:
MarioAbove:
MarioSide:

TopCorner:
BodyInside:
HeadInside:
LDA #$00
STA !Wave_PlayerSafe
RTL

;WallFeet:	; when using db $37
;WallBody:

SpriteV:
SpriteH:
LDA #$00
STA !Wave_SpriteSafe,x
RTL

MarioCape:
MarioFireball:
LDA #$00
RTL

print "Player/Sprite touching this block will NOT be safe from the Layer 2 Wave."