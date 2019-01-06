# SMWStuff
This is a collection of stuff I did for SMW Hacking purposes. I think nothing is really finished. Most of the stuff runs in a regular Browser, some stuff need a PHP-Server enviroment (just execute `php -S localhost:8080` folder with the php-file and navigate with your Browser to "localhost:8080" ).

## LM3LevelFormats
The version 3.00 of Lunar Magic implements new Level formats for SMW. This will allow you to scroll fast through the level formats to see their shape and where the screen exits are. Theres nothing more to it, really.

## 4bppDisplay
This is just a viewer for 4bpp graphics. You need graphics and a palette file for this, which I included for you. Is a bit buggy, if it doesn't update the display just change the Palette and move the cursor over the left image.

## ARGB2pal
Converts a ARGB Palette to SNES-RGB. Left textfield is input, right one is the SNES-RGB output.

## candles.html
This thing simulates the candles in the background of castle levels. This is not 100% accurate, but looks pretty much the same as it does in SMW. Has cool features like the Debug display and frame advance stuff. I remember to use that to understand how it works in SMW so I can hack it to have more candles at different positions.

## Fixes
Just some fixes for SMW. Currently has Sprite Interaction Fixes for Thwomps and Thwimps.

## HEX2Asardblist
I know, weird name. This one converts a Hexstring to a db-List for ASAR. Well, only if you separate the bytes like so:
```
00 11 22 33 .. FF
```
That thing will convert to:
```
db $00,$11,$22,$33,...,$FF
```
Don't know for what I used this. Also Option "Tilemap" doesn't work.

## OWPlayerTilesViewer
This is just the 4bppDisplay with a small expansion for Tilemaps apperantly. Does not work that well and I dont know how to use it anymore.

## SMW Customizer
This was a attempt to create a tool to customize many different aspects of SMW, that Lunar Magic didn't do. Doesn't do anything at the moment, it has many placeholders. Requiers to run a local server.

## VWF Message generator
This tool was intended to enchance the user experience in RPGHacker's VWF Message Patch by giving you a "simple to use" interface with a simulated version of the Patch included in the Editor so you can test the message inside your browser. Sadly I couldn't work on that thing anymore due to work. The GrafixViewer does not work, check out the 4bppDisplay for something that works.


