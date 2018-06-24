<?php
/*
 * LANGUAGE: ENGLISH (EN)
 * THIS IS THE BASE FILE, FEEL FREE TO TRANSLATE THIS INTO YOUR LANGUAGE! REMOVE THIS LINE IF YOU TRANSLATE THIS!
 * AUTHOR: W4mp3
 * LAST UPDATE: 12.09.2013
 * NOTES: Dev Version
 */

 /* Formatting Stuffs (Skip those, if you translate) */
 
 const SPACER = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
 const VERSION = "RC0.1";
 
 /* Units (Frames, Seconds, Pixels, etc. */
 
 const FRAME = "Frame(s)";
 const FRAMES = "Frames";
 const SECOND = "Second(s)";
 const SECONDS = "Second";
 const POINTS = "Points";
 const LIFE = "UP(S)";
 const COINS = "Coins";
 const STANDARD = "Default";
 const GLITCH = "Glitchy!";
 
 /* Title and intro text */
 
 const TITLE = "Super Mario World Customizer";
 const INTRODUCTION_TEXT = "This Script allows you to change many little Values on a ROM. It also features a textbox for custom Hexedits!<br>
                            Feel free to translate this script into your language! This language is provided by: W4mp3.<br> If you think the
                            translation is wrong then PM him at SMWCentral.";
 const INFO_ABOUT_BROWSERS = "This interface (GUI) is optimized for current Browsers with HTML5 support, older browsers might have optical
                              differences but will still work.";
 
 const VERSION_INFO = "WARNING: This Version is not complete. It currently outputs a patch file for Asar and Xkas.";
 
 /* Import */
 
 const IMPORT = "Import from ROM";
                              
 /* Select Menu */
 
 const GAMEPLAY = "Gameplay";
 const SFX = "Sound Effects";
 const PLAYER = "Player";
 const SPRITE = "Sprites";
 const TITLESCREEN = "Title Screen";
 const CUSTOM = "Hexedit";
 const END = "Done";
 
 const FILLBOX_TEXT = "Select one tab.";
                               
 /* Menu Gameplay related */
 
 const GAMEPLAY_TITLE = "Gameplay related Values";
 
 const TIME_TITLE = "Time related Values";
 
 const ALLOW_TIME = "Enable in game timer";
 const TIMER_SPEED = "Decrease Timer every";
 const TIMER_SPEEDUP = "Allow Timer to speed-up when Time is getting low";
 const TIME_KILL = "Kill Player when time is zero";
 const INTRO_TIMER = "Time before you can Skip the Intro Message (Level C5)";
 const TIME_PAUSE = "Time before you can pause again after you unpause:";
 const TIME_PSWITCH = "Length of P-Switch:";
 
 const SCORE_TITLE = "Score related Values";
 
 const SCORE_STATUSBAR = "Display Score on Statusbar";
 const SCORE_3UP = "Score of 3-UP Moon: ";
 const SCORE_BELOW_HIT = "Score Sprites give, when hit with cape or below: ";
 
 const COINS_TITLE = "Coin related Values";
 
 const COINS_GIVE_1UP = "Allow getting lives by getting a certain amount of coins";
 const COINS_1UP_REMOVE = "Amount of coins to remove after getting a 1-UP:";
 const COINS_1UP = "Number of coins needed to get a 1-UP : ";
 
 /* Custom Input */
 
 const CUSTOM_TITLE = "Custom Hexedits";
 const CUSTOM_TEXT = "In this textbox you can type hexedits. The format is pretty simple:<br>
                      First you need to get the address, then write the value.<br>
                      Examples:
                      <div id='example'>;Disables Fireballshooting<br>
                      address=\$00D08A<br>x80<br>
                      <br>
                      ;Disable Throwblock flashing<br>
                      address=\$01A1E1<br>
                      xEA,xEA,xEA,xEA
                      </div>";
 const CUSTOM_INFO = "INFO: Please doublecheck everything you type in here!";
 const CUSTOM_TEXTBOX = "This is a comment, you can remove me!"; # Don't remove this, this is really text :)
 
 /* Footer (Translator stuffs) */
 
 const TRANSLATOR = "W4mp3"; # Put your name here :)
 
 /* Submit Form */
 
 const SUBMIT_TEXT = "Done? Just press this button.";
 const SUBMIT_BUTTON = "Send!";
 
 /* DEBUG TEXT */
 
 const DEBUG_TEXT = "Jemand musste Josef K. verleumdet haben, denn ohne dass er etwas Böses getan hätte, wurde er eines Morgens verhaftet. »Wie ein Hund!« sagte er, es war, als sollte die Scham ihn überleben. Als Gregor Samsa eines Morgens aus unruhigen Träumen erwachte, fand er sich in seinem Bett zu einem ungeheueren Ungeziefer verwandelt. Und es war ihnen wie eine Bestätigung ihrer neuen Träume und guten Absichten, als am Ziele ihrer Fahrt die Tochter als erste sich erhob und ihren jungen Körper dehnte. »Es ist ein eigentümlicher Apparat«, sagte der Offizier zu dem Forschungsreisenden und überblickte mit einem gewissermaßen bewundernden Blick den ihm doch wohlbekannten Apparat. Sie hätten noch ins Boot springen können, aber der Reisende hob ein schweres, geknotetes Tau vom Boden, drohte ihnen damit und hielt sie dadurch von dem Sprunge ab. In den letzten Jahrzehnten ist das Interesse an Hungerkünstlern sehr zurückgegangen. Aber sie überwanden sich, umdrängten den Käfig und wollten sich gar nicht fortrühren. Jemand musste Josef";
?>