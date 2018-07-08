;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ThwimpSpriteInteractionFix - W4mp3/ShUriK KiD - Version 1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This Patch fixes the rather infuriating behaviour of Thwimp seemingly
;; randomly be affected by Sprites in general. This Patch allows you to
;; make Thwimp more consistent with Sprites.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; If you use this patch please credit me, thats what cool people do.
;; This is compatible with SA1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!thwimpInteracts = 1 ; Set to 1 if you want the thwimp to interact with every sprite

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Preparing stuff, detecting SA1 etc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!SA1 = 0
if read1($00FFD5) == $23
 !SA1 = 1
 sa1rom
else
 !SA1 = 0
endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hijacks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For readability
org $01AC31
SubOffscreen0Bnk1:

;; Hijack
org $01AFAA
JSR patch

;; Sneak a JSR to some FreeSpace in Bank 1
org $01E2B0

patch:

JSR SubOffscreen0Bnk1

if !thwimpInteracts

  print "Thwimps will interact with Sprites"
  
  if !SA1

    LDA $762C,x ;\
    AND #$F7    ;|5th Tweaker byte remove do
    STA $762C,x ;/not interact with sprite flag

  else
    LDA $1686,x ;\
    AND #$F7    ;|5th Tweaker byte remove do
    STA $1686,x ;/not interact with sprite flag
  endif
  
  JSL $018032 ;Sprite <-> Sprite Interaction routine

else 
  print "Thwimps will not interact with Sprites"
  
  if !SA1
    LDA $762C,x ;\
    ORA #$08    ;|5th Tweaker byte set do not
    STA $762C,x ;/interact with sprite flag
  else
    LDA $1686,x ;\
    ORA #$08    ;|5th Tweaker byte set do not
    STA $1686,x ;/interact with sprite flag
    
  endif
endif

RTS

