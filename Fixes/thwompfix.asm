;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ThwompSpriteInteractionFix - W4mp3/ShUriK KiD - Version 1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This Patch fixes the rather infuriating behaviour of Thwomps seemingly
;; randomly be affected by Sprites in general. This Patch allows you to
;; make Thwomps more consistent with Sprites.
;; Demonstration Video: https://www.youtube.com/watch?v=K7rjxQWjrrY
;; (Video also explains why Thwomps don't work consistently with other
;; sprites)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; If you use this patch please credit me, thats what cool people do.
;; This is compatible with SA1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!thwompInteracts = 1 ; Set to 1 if you want the thwomp to interact with every sprite

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

;; Just for making the code more readable
org $01AF54
ThwompGFX:

;; TehRealHijack
org $01AEA3
JSR hijack

;; Freespace on Bank 1
org $01CD1E
hijack:
JSR ThwompGFX
autoclean JSL thwompSpriteInteract
RTS

freecode

print "ThwompContactFix Installed @ ",pc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
thwompSpriteInteract:
if !thwompInteracts

  print "Thwomps will interact with Sprites"
  
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
  print "Thwomps will not interact with Sprites"
  
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


RTL

print "Freespace used: ",freespaceuse,"Bytes"
print "-W4mp3"
