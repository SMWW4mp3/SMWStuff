;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Layer 2 Crashing Wave - W4mp3/ShUriK KiD - v1.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A big waves will crash regularly over the player and enemies, taking them
;; down if they aren't below something safe or standing on something solid. You
;; can set areas as safe or unsafe by using the included custom blocks, this
;; does not do that automagically.
;; Setup is not 100% straight forward due to this needing custom blocks and a
;; certain Layer 2 setup. Please read the included `wave_readme.html` for setup
;; instructions.
;;
;; Background Info: I actually made something similar for a contest
;;                  (SMWHacking Turnier 2) but didn't make it properly.
;;                  I put some thought into what did and what didn't work.
;;                  This is the result of that, making the wave crash from
;;                  "behind" instead from the right and making it very
;;                  configurable and flexible.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Some human readable defines :^)
!off = 0
!on = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Defines / Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Read the wave_readme.html for more information!

;; Free RAM (~32 bytes needed for all features)
!RAM_FreeRAM = $1AF8 ; Default: Item Memory Index 2 Table.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Strict Mode (will stop assembling when a warning is generated)
!Setting_StrictMode = !off  ; default: !off

; Performance Mode (read the manual for more information what this does)
!Setting_PerformanceMode = !on ; default: !off

; Lava mode, destroys everything that is not excluded
!Setting_LavaMode = !off    ; default: !off

; Enable the wave interacting with player
!Setting_EnableInteraction_Player = !on ; default: !on

; Enable the wave interacting with sprites
!Setting_EnableInteraction_Sprites = !on    ; default: !on

; Riding Yoshi will make you immune against the wave.
!Setting_RidingYoshiDoesntAffectPlayer = !on    ; default: !on

; Custom Sprites
; Set this to 1 if you do not use custom sprites to increase performance.
!Setting_CustomSpriteHandling = !on

; How the wave flushes the player.
!Setting_WaveInstantKillPlayerWhenTouched = !off
; How the wave flushes sprites.
!Setting_WaveInstantKillSpriteWhenTouched = !on

; Tides
!Setting_EmulateTide = !on
!Setting_EmulateTide_Height = $C1
!Setting_DangerousWaterCurrent = !off

; Enable all SFX. You can disable every sound effect individually.
!Setting_AllowSFX = !on ; default: !on
!Setting_AllowSFX_Warning = !on ; default: !on
!Setting_AllowSFX_Wave = !off ; Disabled by default due to no Wave SFX in SMW

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SPRITES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Which Sprites IDs are immune to the Wave. You can get the sprite ID from
; the "Add Sprites Window". $00 = not immune, $01 = immune
immune_sprites:
{
;;  00  01  02  03  04  05  06  07  08  09  0A  0B  0C  0D  0E  0F
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00 ; 00
db $00,$00,$00,$00,$00,$01,$01,$00,$01,$01,$01,$00,$01,$00,$00,$00 ; 10
db $00,$00,$01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$00,$00,$00,$01 ; 20
db $00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00 ; 30
db $00,$01,$01,$01,$01,$00,$00,$01,$00,$01,$01,$01,$01,$00,$00,$00 ; 40
db $00,$00,$01,$00,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01 ; 50
db $01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$00,$00 ; 60
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$00,$01,$00,$00 ; 70
db $01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$01,$01,$01 ; 80
db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01 ; 90
db $01,$01,$00,$01,$00,$00,$00,$00,$00,$01,$01,$00,$01,$01,$00,$01 ; A0
db $01,$01,$01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$01 ; B0
db $01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01 ; C0
db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00 ; D0
db $01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$00,$01,$00,$01 ; E0
db $00,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; F0
}
.length:

;; Which Custom Sprite IDs are immune to the Wave. You can get the
;; custom sprite ID from the 
;; "Add Sprites Window" > "Custom Collection of Sprites".
;; $00 = not immune, $01 = immune
immune_custom_sprites:
{
if !Setting_CustomSpriteHandling == !on
;;  00  01  02  03  04  05  06  07  08  09  0A  0B  0C  0D  0E  0F
db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 10
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 20
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 30
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 40
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 50
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 60
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 70
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 80
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 90
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; A0
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; B0
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; C0
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; D0
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; E0
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; F0
endif
}
.length:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Advanced Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is more advanced, you do not need to modify these values if you use the
;; template. If you want to make a custom wave you must check if the settings
;; are correct.

;; Wave
; How high the wave goes in pixels
!WAVE_MAX_Y = $016F
; How far the wave scrolls sideways in pixels
!WAVE_MAX_X = $0100
; Where the wave hit line is (should be below !WAVE_MAX_Y)
!WAVE_HITLINE_Y = $0110

;; Wave
; Wave Phases configuration
; Phase 00: Idle, do nothing. Init_Time is used when the level loads the other
; after each full cycle (last Phase → first phase)
!Wave_Phase_00_Init_Time = $00B4 ; Default $00B4 (180) Frames (~3 Seconds)
!Wave_Phase_00_Time = $00B4 ; Default $00B4 (180) Frames (~3 Seconds)

; Phase 01: Show Warning
!Wave_Phase_01_Time = $0061 ; Wait/Show Warning for 97 Frames (~1,5 seconds)
; SFX to play
!Wave_Phase_01_Warning_SFX = $01
!Wave_Phase_01_Warning_SFX_Bank = $1DFC
!Wave_Phase_01_Warning_SFX_Speed = $20 ; Every 32th Frame (~0,5 seconds)


; Phase 02: Move Wave upwards
!Wave_Phase_02_Wave_SFX = $00
!Wave_Phase_02_Wave_SFX_Bank = $1DFC
!Wave_Phase_02_Wave_SFX_Speed = $04 ; Every 4th Frame (~1/15 s)
!Wave_Phase_02_Wave_Init_Speed = $0006

; Phase 03: Move Wave to side
; How fast the wave moves to the side. This determines the time between this 
; phase and the next phase. Lower value == longer. Must be between 01 and 10.
!Wave_Phase_03_SidewaysSpeed = $04
; SFX to play
!Wave_Phase_03_Wave_SFX = $00
!Wave_Phase_03_Wave_SFX_Bank = $1DFC
!Wave_Phase_03_Wave_SFX_Speed = $04 ; Every 4th Frame (~1/15 s)

; Phase 04: Crash Wave downwards
!Wave_Phase_04_Wave_SFX = $00
!Wave_Phase_04_Wave_SFX_Bank = $1DFC
!Wave_Phase_04_Wave_SFX_Speed = $04 ; Every 4th Frame (~1/15 s)
!Wave_Phase_04_Wave_Max_Speed = $0006


; Phase 05: Reset to default Position
; Nothing to configure for this phase.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; More Advanced Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Most of the time you will not need to change these values.

; Do not ignore errors. This Flag should only be changed if you are very sure
; what you are doing. No, do not set this to !off to disable any error checks.
!DontIgnoreErrors = !on

; Do not show warnings. This Flag should only be changed if you have modified
; something. Do not set this to !off to disable any warnings.
!DontIgnoreWarnings = !on


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Defines (DO NOT TOUCH UNLESS YOU KNOW WHAT YOU ARE DOING)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; DEBUG
!DEBUG = !off

macro define_sprite_table(name, addr, addr_sa1)
	if !sa1 == 0
		!<name> = <addr>
	else
		!<name> = <addr_sa1>
	endif
endmacro

!SpriteCount = 12
if !sa1
    !SpriteCount = 22
endif

;; Prechecks for values, so people don't try to break it and blame someone

if !DontIgnoreErrors > 0

    if !Wave_Phase_03_SidewaysSpeed == $0000 || !Wave_Phase_03_SidewaysSpeed > $0010
        error "!Wave_Phase_03_SidewaysSpeed has an invalid value. Valid: Between $01 and $10."
    endif
    
    if !Wave_Phase_02_Wave_Init_Speed == $0000 || !Wave_Phase_02_Wave_Init_Speed > $0010
        error "!Wave_Phase_02_Wave_Init_Speed has an invalid value. Valid: Between $01 and $10."
    endif
    
    if !WAVE_MAX_X > $0F00
        error "!WAVE_MAX_X out of reasonable bounds. You can go from $0000 to $0F00, anything else will not work due to having at most 16 Screens with a layer 2 level."
    endif
    
endif

!hasWarnings = 0
if !DontIgnoreWarnings > 0

    if !DEBUG > 0
        print "+---------------------------------------------------------------------+"
        print "| DEBUG is set, it will draw stuff on Layer 3 for debugging purposes! |"
        print "+---------------------------------------------------------------------+"
        !hasWarnings #= !hasWarnings+1
    endif

    if !Wave_Phase_00_Init_Time == $0000
        print "Wave_Phase_00_Init_Time is zero! This means it will wait for 65536 Frames (~18 Minutes) before going to phase 1. I bet you do not want this."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !Wave_Phase_00_Init_Time > $0708
        print "Wave_Phase_00_Init_Time is bigger than 30 Seconds (1800 Frames). This is a very long time, maybe reduce it?"
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !Wave_Phase_00_Time == $0000
        print "Wave_Phase_00_Time is zero! This means it will wait for 65536 Frames (~18 Minutes) before going to phase 1. I bet you do not want this."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !Wave_Phase_00_Time > $0708
        print "Wave_Phase_00_Time is bigger than 30 Seconds (1800 Frames). This is a very long time, maybe reduce it?"
        !hasWarnings #= !hasWarnings+1
    endif
        
    if !Wave_Phase_01_Time == $0000
        print "Wave_Phase_01_Time is zero! This means it will wait for 65536 Frames (~18 Minutes) before going to phase 2. I bet you do not want this."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !Wave_Phase_01_Time > $0708
        print "Wave_Phase_01_Time is bigger than 30 Seconds (1800 Frames). This is a very long time, maybe reduce it?"
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !WAVE_MAX_X == $0000
        print "WAVE_MAX_X is zero which means Phase 03 will be skipped."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !WAVE_MAX_X < $0100
        print "WAVE_MAX_X is smaller than 256 ($0100). While this is not an error I'll just warn you that it will look very weird."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !WAVE_MAX_X > $0200
        print "WAVE_MAX_X is bigger than 512 ($0200). Please do not set this bigger than the amount of used screens - 1 * $100 or else the wave will display garbage tiles."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !WAVE_MAX_Y < $00D1
        print "WAVE_MAX_Y is smaller than 225 ($00D1) which means the wave will not rise above the top of the screen. This means the wave will not hit the player/sprites that are above that value. This warning can be ignored if you know what you are doing."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !WAVE_MAX_Y > $0200
        print "WAVE_MAX_Y is a very high value (>$0200). While this is not an error please do not set this higher than your level is or it will display garbage tiles."
        !hasWarnings #= !hasWarnings+1
    endif
    
    if !Setting_AllowSFX > 0
        
        if !Setting_AllowSFX_Warning > 0 && !Wave_Phase_01_Warning_SFX == $00
            print "Wave_Phase_01_Warning_SFX is $00 (no SFX will play)"
        endif
        
        if !Setting_AllowSFX_Wave > 0
            if !Wave_Phase_02_Wave_SFX == $00
                print "Wave_Phase_02_Wave_SFX is $00 (no SFX will play)"
            endif
            if !Wave_Phase_03_Wave_SFX == $00
                print "Wave_Phase_03_Wave_SFX is $00 (no SFX will play)"
            endif
            if !Wave_Phase_03_Wave_SFX == $00
                print "Wave_Phase_03_Wave_SFX is $00 (no SFX will play)"
            endif
            if !Wave_Phase_04_Wave_SFX == $00
                print "Wave_Phase_04_Wave_SFX is $00 (no SFX will play)"
            endif
        endif
        
    
    endif
    
    if !hasWarnings > 0
        if !Setting_StrictMode == 1
        
            print "--------------------------------------------------------------------------------"
            print "There are !hasWarnings Warnings you need to fix, will not assemble."
            print "--------------------------------------------------------------------------------"
            error ""
            
        else
        
            print "--------------------------------------------------------------------------------"
            print "There are !hasWarnings Warnings you might want to check. Continue assembling..."
            print "--------------------------------------------------------------------------------"
        
        endif
    endif
    
endif

;; Sprites
%define_sprite_table(sprite_num, $9E, $3200)
%define_sprite_table(sprite_speed_y, $AA, $9E)
%define_sprite_table(sprite_speed_x, $B6, $B6)
%define_sprite_table(sprite_y_low, $D8, $3216)
%define_sprite_table(sprite_status, $14C8, $3242)
%define_sprite_table(sprite_y_high, $14D4, $3258)
%define_sprite_table(sprite_obj_interact, $15DC, $7562)
%define_sprite_table(sprite_in_water, $164A, $75BA)
%define_sprite_table(sprite_cape_disable_time, $1FE2, $7FD6)
%define_sprite_table(extra_bits, $7FAB10, $400040)

;; Extended Sprites
!ExtendedCount = 16
!extended_num = $170B|!addr

;; Cluster Sprites
!ClusterCount = 32
!cluster_num = $1892|!addr

;; Wave specific RAM Addresses
!RAM_FreeRAM #= !RAM_FreeRAM|!addr
!Wave_State = !RAM_FreeRAM
!Wave_Timer = !RAM_FreeRAM+1 ; 2 bytes !
!Wave_Speed = !RAM_FreeRAM+3 ; 2 bytes !
!DEBUG_DRAWCYCLE = !RAM_FreeRAM+5 ; 1 byte
!Wave_Misc_Timer = !RAM_FreeRAM+6 ; 1 byte !
!Wave_PlayerSafe = !RAM_FreeRAM+7
!Wave_SpriteSafe = !RAM_FreeRAM+8

;; RAM Defines
!RAM_Counter_LocalFrames = $14

!RAM_CurrentLayer1XPosLo = $1A
!RAM_CurrentLayer1XPosHi = !RAM_CurrentLayer1XPosLo+$01
!RAM_CurrentLayer1YPosLo = $1C
!RAM_CurrentLayer1YPosHi = !RAM_CurrentLayer1YPosLo+$01
!RAM_CurrentLayer2XPosLo = $1E
!RAM_CurrentLayer2XPosHi = !RAM_CurrentLayer2XPosLo+$01
!RAM_CurrentLayer2YPosLo = $20
!RAM_CurrentLayer2YPosHi = !RAM_CurrentLayer2YPosLo+$01
!RAM_CurrentLayer3XPosLo = $22
!RAM_CurrentLayer3XPosHi = !RAM_CurrentLayer3XPosLo+$01
!RAM_CurrentLayer3YPosLo = $24
!RAM_CurrentLayer3YPosHi = !RAM_CurrentLayer3YPosLo+$01

!RAM_Camera_LastScreenHoriz = $5E

!RAM_Player_SwimmingFlag = $75
!RAM_Player_FacingDirection = $76
!RAM_Player_BlockedFlags = $77

!RAM_Player_XSpeed = $7B
!RAM_Player_YSpeed = $7D

!RAM_Player_OnScreenPosXLo = $7E
!RAM_Player_OnScreenPosXHi = !RAM_Player_OnScreenPosXLo+$01
!RAM_Player_OnScreenPosYLo = $80
!RAM_Player_OnScreenPosYHi = !RAM_Player_OnScreenPosYLo+$01

!RAM_Player_XPosLo = $94
!RAM_Player_XPosHi = !RAM_Player_XPosLo+$01
!RAM_Player_YPosLo = $96
!RAM_Player_YPosHi = !RAM_Player_YPosLo+$01

!RAM_Flag_SpritesLocked = $9D

!RAM_HDMATable = $0F5E|!addr

!RAM_Timer_PreventPause = $13D3|!addr
!RAM_Flag_Pause = $13D4|!addr

!RAM_Blocks_NoteBlockBounceFlag = $1402|!addr
!RAM_Flag_Layer1HorizontalScrollLevelSetting = $1411|!addr
!RAM_Flag_Layer1VerticalScrollLevelSetting = $1412|!addr

!RAM_Misc_Layer1XPosLo = $1462|!addr
!RAM_Misc_Layer1XPosHi = !RAM_Misc_Layer1XPosLo+$01
!RAM_Misc_Layer1YPosLo = !RAM_Misc_Layer1XPosLo+$02
!RAM_Misc_Layer1YPosHi = !RAM_Misc_Layer1YPosLo+$01
!RAM_Misc_Layer2XPosLo = !RAM_Misc_Layer1XPosLo+$04
!RAM_Misc_Layer2XPosHi = !RAM_Misc_Layer2XPosLo+$01
!RAM_Misc_Layer2YPosLo = !RAM_Misc_Layer1XPosLo+$06
!RAM_Misc_Layer2YPosHi = !RAM_Misc_Layer2YPosLo+$01

!RAM_Player_DisableObjectInteractionFlag = $185C|!addr
!RAM_Player_RidingYoshiFlag = $187A|!addr

;; SA-1-ify user defines

!Wave_Phase_01_Warning_SFX_Bank #= !Wave_Phase_01_Warning_SFX_Bank|!addr
!Wave_Phase_02_Wave_SFX_Bank #= !Wave_Phase_02_Wave_SFX_Bank|!addr
!Wave_Phase_03_Wave_SFX_Bank #= !Wave_Phase_03_Wave_SFX_Bank|!addr
!Wave_Phase_04_Wave_SFX_Bank #= !Wave_Phase_04_Wave_SFX_Bank|!addr

;; ROM defines
!ROM_Hex2Dec = $00974C
!ROM_GameEndPlayer = $00F606
!ROM_GameEndPlayer_NoAnimation = $00F60A

;; Registers

!HDMA_DMA_Control = $4300|(!Free_HDMA_Channel*16)
!HDMA_DMA_DestinationRegister = !HDMA_DMA_Control+1
!HDMA_DMA_Source_lo = !HDMA_DMA_Control+2
!HDMA_DMA_Source_hi = !HDMA_DMA_Control+3
!HDMA_DMA_Source_bank = !HDMA_DMA_Control+4

;; Etc.
!UsedRAM = 8
if !Setting_EnableInteraction_Sprites > 0
    !UsedRAM #= !UsedRAM+!SpriteCount
endif

;; Lavamode overrides
if !Setting_LavaMode > 0
    !Setting_RidingYoshiDoesntAffectPlayer = !off
    !Setting_WaveInstantKillPlayerWhenTouched = !on    
    !Setting_WaveInstantKillSpriteWhenTouched = !on
endif

;; Performance Mode tweaking the set variables so it is the same speed and time
if !Setting_PerformanceMode > 0
    !Wave_Phase_00_Init_Time #= !Wave_Phase_00_Init_Time>>1
    !Wave_Phase_00_Time #= !Wave_Phase_00_Time>>1
    !Wave_Phase_01_Time #= !Wave_Phase_01_Time>>1
    !Wave_Phase_01_Warning_SFX_Speed #= !Wave_Phase_01_Warning_SFX_Speed>>1
    !Wave_Phase_02_Wave_Init_Speed #= !Wave_Phase_02_Wave_Init_Speed<<1
    !Wave_Phase_02_Wave_SFX_Speed #= !Wave_Phase_02_Wave_SFX_Speed>>1
    !Wave_Phase_03_SidewaysSpeed #= !Wave_Phase_03_SidewaysSpeed<<1
    !Wave_Phase_04_Wave_Max_Speed #= !Wave_Phase_04_Wave_Max_Speed<<1
endif

init:
{
LDA #$00
STA $212C ;TM
LDA #$17
STA $212D ;TS


REP #$20
    LDX #!UsedRAM
    .clear_RAM_loop:
    STZ !RAM_FreeRAM,x
    DEX
    DEX
    BPL .clear_RAM_loop
    
    LDA #(!Wave_Phase_00_Init_Time|$0000)
    STA !Wave_Timer
SEP #$20
; RTL - Not needed actually
}

main:
{

if !DEBUG > 0
    JSR DEBUG_FUNCTION
endif

if !Setting_EmulateTide == !on
    ; Set player in liquid
    REP #$20
        LDA !RAM_Player_OnScreenPosYLo
        CMP #!Setting_EmulateTide_Height|$0000
        BMI .player_above_water
    SEP #$20
    LDA #$01
    STA !RAM_Player_SwimmingFlag
    .player_above_water:
    SEP #$20
    
    ; Set sprite in liquid

    LDX #!SpriteCount
    .tide_loop:
    ; we only check alive sprites
    LDA !sprite_status,x
    CMP #$08
    BMI .tide_dead_sprite
    
    LDA !sprite_y_high,x
    XBA
    LDA !sprite_y_low,x
    REP #$20
        ; calculate onscreen position of sprite
        CLC
        SBC !RAM_CurrentLayer1YPosLo
        CMP #!Setting_EmulateTide_Height|$0000
        BMI .sprite_above_water
    SEP #$20
    LDA #$01
    STA !sprite_in_water,x
    ; Disable Water splash or we get those spammed
    INC
    STA !sprite_cape_disable_time,x
        .sprite_above_water:
    .tide_dead_sprite:
    SEP #$20
    DEX
    BPL .tide_loop
    
endif

if !Setting_DangerousWaterCurrent == !on
    
endif

if !Setting_PerformanceMode > 0
    ;; Make the Wave only run every second Frame
    LDA !RAM_Counter_LocalFrames
    AND #$01
    BEQ .noUpdate
    
endif

;; Don't do anything when paused or hit
LDA !RAM_Flag_SpritesLocked
ORA !RAM_Flag_Pause
BNE .noUpdate

;; Run Wave Phases
LDA !Wave_State
ASL
TAX
JSR (phase_pointers,x)

;; Update Wave Timer
REP #$20
    LDA !Wave_Timer
    DEC A
    BNE .noPhaseChange
SEP #$20

;; Check if we need to switch states
LDA !Wave_State
INC A
CMP.b #((phase_pointers_length-phase_pointers)/2)
BNE .noResetWavePhase
LDA #$00
.noResetWavePhase:
STA !Wave_State
ASL
TAX
JSR (phase_init_pointers,x)
REP #$20
.noPhaseChange:
    STA !Wave_Timer
SEP #$20

.noUpdate:
RTL
}

if !DEBUG > 0
    ;; DEBUG_FUNCTION is used for debugging purposes. It displays on screen
    ;; the !FreeRAM values, 1/2 row each frame.
    DEBUG_FUNCTION:
    {
    LDA #$DB
    STA $1FFF|!addr
 
    !DEBUG_LOOPCOUNT = !UsedRAM/8+1
 
    LDA !DEBUG_DRAWCYCLE
    ASL
    TAX
    
    REP #$20
        LDA .pointer_drawtarget,x
        STA $00
        LDA .pointer_ram,x
        STA $02
    SEP #$20
    LDA #$01
    STA $04
    LDX #$07
    .debug_loop:
    JSL Function_DEBUG_DisplayRAM
    REP #$20
        INC $00
        INC $00
        INC $02
    SEP #$20
    DEX
    BPL .debug_loop
    
    LDA !DEBUG_DRAWCYCLE
    INC A
    STA !DEBUG_DRAWCYCLE
    CMP #!DEBUG_LOOPCOUNT
    BNE .debug_no_loop
    STZ !DEBUG_DRAWCYCLE
    .debug_no_loop
    
    RTS
    
    .pointer_drawtarget:
    dw $50A0, $50B0, $50C0, $50D0, $50E0, $50F0, $5100, $5110
    dw $5120, $5130, $5140, $5150, $5160, $5170, $5180, $5190
    dw $51A0, $51B0, $51C0, $51D0, $51E0, $51F0, $5200, $5210
    dw $5220, $5230, $5240, $5250, $5260, $5270, $5280, $5290
    
    .pointer_ram:
    dw !RAM_FreeRAM, !RAM_FreeRAM+$08, !RAM_FreeRAM+$10, !RAM_FreeRAM+$18
    dw !RAM_FreeRAM+$20, !RAM_FreeRAM+$28, !RAM_FreeRAM+$30, !RAM_FreeRAM+$38
    dw !RAM_FreeRAM+$40, !RAM_FreeRAM+$48, !RAM_FreeRAM+$50, !RAM_FreeRAM+$58
    dw !RAM_FreeRAM+$60, !RAM_FreeRAM+$68, !RAM_FreeRAM+$70, !RAM_FreeRAM+$78
    }
endif

;; Phase 00 - IDLE INIT
Phase_00_init:
{
REP #$20
    LDA #(!Wave_Phase_00_Time|$0000)
;; Dangerous 16-bit return!
RTS
}
;; Phase 00 - IDLE
Phase_00:
{
RTS
}
;; Phase 01 - SHOW WARNING INIT
Phase_01_init:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Warning > 0 && !Wave_Phase_01_Warning_SFX > 0
    STZ !Wave_Misc_Timer
endif
REP #$20
    LDA #(!Wave_Phase_01_Time|$0000)
RTS
}
;; Phase 01 - SHOW WARNING
Phase_01:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Warning > 0 && !Wave_Phase_01_Warning_SFX > 0
    JSR Function_SFXTimer
endif
RTS
}
;; Phase 02 - MOVE WAVE UP INIT
Phase_02_init:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Wave > 0 && !Wave_Phase_02_Wave_SFX > 0
    STZ !Wave_Misc_Timer
endif
REP #$20
    LDA #(!Wave_Phase_02_Wave_Init_Speed|$0000)
    STA !Wave_Speed
    LDA #$FFFF
RTS
}
;; Phase 02 - MOVE WAVE UP
Phase_02:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Wave > 0 && !Wave_Phase_02_Wave_SFX > 0
    JSR Function_SFXTimer
endif

REP #$20
    LDA !RAM_CurrentLayer2YPosLo
    CLC
    ADC !Wave_Speed
    STA !RAM_Misc_Layer2YPosLo
        
SEP #$20
LDA !RAM_Counter_LocalFrames
AND #$0F
BNE .noSpeedChange
REP #$20
    LDA !Wave_Speed
    BNE .noSpeedChange
    DEC
    STA !Wave_Speed
.noSpeedChange:
REP #$20
    LDA !RAM_Misc_Layer2YPosLo
    CMP #!WAVE_MAX_Y
    BMI .waveDidntGoHighEnough
    LDA #!WAVE_MAX_Y           ; \ just in case
    STA !RAM_Misc_Layer2YPosLo ; /
    LDA #$0001
    STA !Wave_Timer
    .waveDidntGoHighEnough:
SEP #$20
RTS
}
;; Phase 03 - MOVE WAVE SIDEWAYS INIT
Phase_03_init:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Wave > 0 && !Wave_Phase_03_Wave_SFX > 0
    STZ !Wave_Misc_Timer
endif
REP #$20
    LDA #$FFFF
RTS
}
;; Phase 03 - MOVE WAVE SIDEWAYS
Phase_03:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Wave > 0 && !Wave_Phase_03_Wave_SFX > 0
    JSR Function_SFXTimer
endif

REP #$20
    LDA !RAM_CurrentLayer2XPosLo
    CLC
    ADC #(!Wave_Phase_03_SidewaysSpeed|$0000)
    STA !RAM_Misc_Layer2XPosLo
    CMP #!WAVE_MAX_X
    BMI .notDone
    LDA #!WAVE_MAX_X            ; \ just in case
    STA !RAM_Misc_Layer2XPosLo  ; / 
    LDA #$0001
    STA !Wave_Timer
    .notDone:
RTS
}
;; Phase 04 - MOVE WAVE DOWN INIT
Phase_04_init:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Wave > 0 && !Wave_Phase_04_Wave_SFX > 0
    STZ !Wave_Misc_Timer
endif
REP #$20
    LDA #$0001
    STA !Wave_Speed
    LDA #$FFFF
RTS
}
;; Phase 04 - MOVE WAVE DOWN
Phase_04:
{
if !Setting_AllowSFX > 0 && !Setting_AllowSFX_Wave > 0 && !Wave_Phase_04_Wave_SFX > 0
    JSR Function_SFXTimer
endif

; Disable Vertical scroll while the wave crashes downwards.
; STZ $1404|!addr
; STZ $1406|!addr
STZ !RAM_Flag_Layer1VerticalScrollLevelSetting


REP #$20
    LDA !RAM_CurrentLayer2YPosLo
    SEC
    SBC !Wave_Speed
    STA !RAM_Misc_Layer2YPosLo
        
SEP #$20
LDA !RAM_Counter_LocalFrames
if !Setting_PerformanceMode > 0
    AND #$06
else
    AND #$0F
endif
BNE .noSpeedChange
REP #$20
    LDA !Wave_Speed
    CMP #(!Wave_Phase_04_Wave_Max_Speed|$0000)
    BEQ .noSpeedChange
    INC
    STA !Wave_Speed
.noSpeedChange:
REP #$20
    LDA !RAM_Misc_Layer2YPosLo
    BPL .waveDidntGoLowEnough
    STZ !RAM_Misc_Layer2YPosLo ; We shouldn't forget to set this to zero or we do garbage tiles at the top of the screen.
    LDA #$0001
    STA !Wave_Timer
    .waveDidntGoLowEnough:
SEP #$20

; Let's define the hitline once and reuse it :)
REP #$20
    LDA #!WAVE_HITLINE_Y|$0000
    CLC
    SBC !RAM_CurrentLayer2YPosLo
    BPL .waveOnscreen
    JMP .waveOffscreenTop
    .waveOnscreen:
    ; we need to convert this from screen coordinate to real Y-Position
    CLC
    ADC !RAM_CurrentLayer1YPosLo
    STA $00 ; Y-Pos of wave line in level coordinates
    AND #$FFF0
    STA $02 ; Y-Pos but it's 16 high to detect if object should be affected
SEP #$20

; Now we check if we need to stick the player/sprite to the wave
if !Setting_EnableInteraction_Player == !on
    ; first the player (because thats the easiest thing to do)
    STZ !RAM_Player_DisableObjectInteractionFlag
    
    LDA !Wave_PlayerSafe
    
    if !Setting_RidingYoshiDoesntAffectPlayer == !on
        ; Check if riding yoshi
        ORA !RAM_Player_RidingYoshiFlag
    endif
    
    BNE .playerIsSafe
    
    REP #$20
        
        LDA !RAM_Player_YPosLo
        AND #$FFF0
        CMP $02
        BNE .playerIsSafe16bit
        
    SEP #$20
    
    if !Setting_WaveInstantKillPlayerWhenTouched == 0
        STZ !RAM_Player_YSpeed
        ; STZ !RAM_Player_BlockedFlags 
        LDA #$01
        STA !RAM_Player_DisableObjectInteractionFlag
        ; STA !RAM_Blocks_NoteBlockBounceFlag
        
        REP #$20
            ; We need to push the player downwards.
            
            LDA !RAM_Player_YPosLo
            CLC
            ADC !Wave_Speed
            INC ; Just in case
            STA !RAM_Player_YPosLo
            ; We need to check if the player is basically offscreen,
            ; else the camera has the potential to scroll and the player survives.
            LDA !RAM_Player_OnScreenPosYLo
            CMP #$00D0
            BMI .noPlayerGameEnd
        SEP #$20
        JSL !ROM_GameEndPlayer_NoAnimation
            
            .noPlayerGameEnd:
        ; NOP
            
    else
        SEP #$20
        JSL !ROM_GameEndPlayer_NoAnimation
    endif
    .playerIsSafe16bit:
    SEP #$20
    
    

    .playerIsSafe:
endif


; now we check all sprites.

if !Setting_EnableInteraction_Sprites == !on

    LDX #!SpriteCount
    .loopSprites:
    ; unused slots we can skip.
    LDA !sprite_num,x
    TAY ; Y = Sprite Number
    ; we do not need to test safe sprites
    LDA !Wave_SpriteSafe,x
    BNE .skipSprite
    ; dead sprites we do not touch
    LDA !sprite_status,x
    CMP #$08
    BMI .skipSprite

    ; check if sprite number is immune
    if !Setting_CustomSpriteHandling == !on
        
        LDA !extra_bits,x
        AND #$08
        BEQ .notACustomSprite
        PHX
        TYX
        LDA immune_custom_sprites,x
        BRA .wasACustomSprite
        
    endif
    .notACustomSprite:
    PHX
    TYX
    LDA immune_sprites,x
    .wasACustomSprite:
    BNE .skipSpriteButPullX
    PLX

    ; Sprite is in danger zone
    LDA !sprite_y_high,x
    XBA
    LDA !sprite_y_low,x
    REP #$20
        AND #$FFE0
        CMP $02
        BNE .spriteIsSafe16bit
    
    if !Setting_WaveInstantKillSpriteWhenTouched == !off
        CLC
        ADC !Wave_Speed ; \ For whatever reason I have to add twice
        ADC !Wave_Speed ; / here, player interaction works better?
        if !Setting_PerformanceMode == !on
            ADC !Wave_Speed ; Sprites will not properly stick without this
        endif
        
        
        
    SEP #$20
    
    STA !sprite_y_low,x
    XBA
    STA !sprite_y_high,x
    
    STZ !sprite_speed_y,x
    STZ !sprite_speed_x,x
    
    LDA #$01
    STA !sprite_obj_interact,x
    else
        SEP #$20
        if !Setting_LavaMode == !off
            LDA #$80 ; We put the sprite offscreen, that's the safest thing
            STA !sprite_y_high,x
        else
            LDA #$05
            STA !sprite_status,x
        endif
        ; kill sprite instantly
    endif
        .spriteIsSafe16bit:
    SEP #$20
    .skipSprite:
    DEX
    BPL .loopSprites
endif
.waveOffscreenTop:
RTS
.skipSpriteButPullX:
PLX
BRA .skipSprite
}
;; Phase 05 - RESET INIT
Phase_05_init:
{
REP #$20
    LDA #$FFFF
    
RTS
}
;; Phase 05 - RESET
Phase_05:
{
REP #$20
    LDA !RAM_CurrentLayer2XPosLo
    CLC
    SBC #$0008
    STA !RAM_Misc_Layer2XPosLo
    BPL .notDone
    STZ !RAM_Misc_Layer2XPosLo  ; just in case
    LDA #$0001
    STA !Wave_Timer
    .notDone:
RTS
}

phase_pointers:
{
dw Phase_00
dw Phase_01
dw Phase_02
dw Phase_03
dw Phase_04
dw Phase_05
.length:
}

phase_init_pointers:
{
dw Phase_00_init
dw Phase_01_init
dw Phase_02_init
dw Phase_03_init
dw Phase_04_init
dw Phase_05_init
.length:
}

;; Misc. Functions
if !Setting_AllowSFX > 0
    phase_sfx:
    db $00, !Wave_Phase_01_Warning_SFX, !Wave_Phase_02_Wave_SFX, !Wave_Phase_03_Wave_SFX
    db !Wave_Phase_04_Wave_SFX, $00

    phase_sfx_bank:
    db $00, !Wave_Phase_01_Warning_SFX_Bank&$03, !Wave_Phase_02_Wave_SFX_Bank&$03, !Wave_Phase_03_Wave_SFX_Bank&$03
    db !Wave_Phase_04_Wave_SFX_Bank&$03, $00
    
    phase_timer_speed:
    db $00, !Wave_Phase_01_Warning_SFX_Speed, !Wave_Phase_02_Wave_SFX_Speed, !Wave_Phase_03_Wave_SFX_Speed
    db !Wave_Phase_04_Wave_SFX_Speed, $00

    Function_SFXTimer:
    ;; X = Current Phase * 2
    TXA
    LSR
    TAX
    LDA !Wave_Misc_Timer
    BNE .noSFX
    LDA phase_timer_speed,x
    STA !Wave_Misc_Timer
    LDA phase_sfx,x
    LDY phase_sfx_bank,x
    STA $1DFC|!addr,y
    .noSFX:
    DEC !Wave_Misc_Timer
    RTS
endif

;; Debug Helper

if !DEBUG > 0

    Function_DEBUG_DisplayRAM:
    {
    ;; Function to display RAM value on Layer 3
    ;; $00, $01 - Layer3 Pos ($5000 is beginning of layer 3)
    ;; $02, $03 - RAM_Address ($0000-$FFFF, always bank $7E)
    ;; $04 - Display Mode ($00 = raw tile X, $01 = hex XX, $02 = dec XXX, $03 = 16 bit hex XXXX)
    STZ $2115
    REP #$20
        LDA $00
        STA $2116
    SEP #$20
    LDA $04
    BEQ .displayRaw
    DEC A
    BEQ .displayHex
    DEC A
    BEQ .displayDec

    .display16bithex
    REP #$20
        LDA ($02)
        AND #$F000
    SEP #$20
    XBA
    LSR #4
    STA $2118
    REP #$20
        LDA ($02)
        AND #$0F00
    SEP #$20
    XBA
    STA $2118
    BRA .displayHex

    .displayDec:
    LDA ($02)
    JSL !ROM_Hex2Dec
    STA $05
    TXA
    JSL !ROM_Hex2Dec
    STX $2118
    STA $2118
    LDA $05
    STA $2118
    RTL

    .displayHex:
    LDA ($02)
    AND #$F0
    LSR #4
    STA $2118
    LDA ($02)
    AND #$0F
    STA $2118
    RTL

    .displayRaw:

    LDA ($02)
    STA $2118

    RTL
    }
endif


