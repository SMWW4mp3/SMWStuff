<!DOCTYPE html>
<!-- DO NOT CHANGE THIS FILE, PLEASE! -->
<html>
<head>
  <title>SMW Customizer - By W4mp3</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <script>
    function activate(activate) {
      document.getElementById('gameplay').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('sfx').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('player').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('sprite').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('titlescreen').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('end').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('fillbox').setAttribute('style','visibility:hidden;display:none');
      document.getElementById('custom').setAttribute('style','visibility:hidden;display:none');
      
      if (activate == 'gameplay') {
         document.getElementById('gameplay').setAttribute('style','visibility:visible;display:block');
      }
      if (activate == 'sfx') {
         document.getElementById('sfx').setAttribute('style','visibility:visible;display:block');
      }
      if (activate == 'player') {
         document.getElementById('player').setAttribute('style','visibility:visible;display:block');
      }
      if (activate == 'sprite') {
         document.getElementById('sprite').setAttribute('style','visibility:visible;display:block');
      }
      if (activate == 'titlescreen') {
         document.getElementById('titlescreen').setAttribute('style','visibility:visible;display:block');
      }
      if (activate == 'custom') {
         document.getElementById('custom').setAttribute('style','visibility:visible;display:block');
      }
      if (activate == 'end') {
         document.getElementById('end').setAttribute('style','visibility:visible;display:block');
      }
    }
  </script>
</head>
<body>
<header>
<?php

function score() {
  echo "<option value='00'>0 ".POINTS."</option>
        <option value='01'>10 ".POINTS."</option>
        <option value='02'>20 ".POINTS."</option>
        <option value='03'>40 ".POINTS."</option>
        <option value='04'>80 ".POINTS."</option>
        <option value='05'>100 ".POINTS."</option>
        <option value='06'>200 ".POINTS."</option>
        <option value='07'>400 ".POINTS."</option>
        <option value='08'>800 ".POINTS."</option>
        <option value='09'>1000 ".POINTS."</option>
        <option value='0A'>2000 ".POINTS."</option>
        <option value='0B'>4000 ".POINTS."</option>
        <option value='0C'>8000 ".POINTS."</option>
        <option value='0D'>1 ".LIFE."</option>
        <option value='0E'>2 ".LIFE."</option>
        <option value='0F'>3 ".LIFE."</option>
        <option value='10'>5 ".LIFE."</option>
        <option value='11'>5 ".COINS."(".GLITCH.")</option>
        <option value='12'>10 ".COINS."(".GLITCH.")</option>
        <option value='13'>15 ".COINS."(".GLITCH.")</option>
        <option value='14'>20 ".COINS."(".GLITCH.")</option>
        <option value='15'>25 ".COINS."(".GLITCH.")</option>";
}

function scoreBelow() {
  echo "<option value='00'>0 ".POINTS."(".STANDARD.")</option>
        <option value='FC'>10 ".POINTS."</option>
        <option value='FD'>20 ".POINTS."</option>
        <option value='FE'>40 ".POINTS."</option>
        <option value='FF'>80 ".POINTS."</option>
        <option value='01'>200 ".POINTS."</option>
        <option value='02'>400 ".POINTS."</option>
        <option value='03'>800 ".POINTS."</option>
        <option value='04'>1000 ".POINTS."</option>
        <option value='05'>2000 ".POINTS."</option>
        <option value='06'>4000 ".POINTS."</option>
        <option value='07'>8000 ".POINTS."</option>
        <option value='08'>1 ".LIFE."</option>
        <option value='09'>2 ".LIFE."</option>
        <option value='0A'>3 ".LIFE."</option>
        <option value='0B'>5 ".LIFE."</option>";
}

  include "lang.php";
  if (!isset($_GET["lang"])) {
    $_GET["lang"] = "en";
  }
  
  if ($_GET["lang"] == "en") {
    include "en.php";
  }
  if ($_GET["lang"] == "de") {
    include "de.php";
  }
?>
</header>
<?php
  echo "<h1>".TITLE."</h1>";
  echo "<p>".VERSION_INFO."</p>";
  echo "<p>".INTRODUCTION_TEXT."</p>";
  echo "<p>".INFO_ABOUT_BROWSERS."</p>";
?>
<!-- <form name="import" action="?import=true" method="post" enctype="multipart/form-data">
 <input type="file" name="file" maxlength="4194816" accept="*"><br>
 <input type="submit" value=<?php echo "'".IMPORT."'"; ?>>
</form><br>-->
<div id="selector">
<?php
  echo "<a onclick='activate(\"gameplay\")'>".GAMEPLAY."</a>
        <a onclick='activate(\"sfx\")'>".SFX."</a>
        <a onclick='activate(\"player\")'>".PLAYER."</a>
        <a onclick='activate(\"sprite\")'>".SPRITE."</a>
        <a onclick='activate(\"titlescreen\")'>".TITLESCREEN."</a>
        <a onclick='activate(\"custom\")'>".CUSTOM."</a>
        <a onclick='activate(\"end\")'>".END."</a>
        ";
?>
</div>
<form id="master" action="compile.php" method="post">
<div id="fillbox">
<?php
  echo FILLBOX_TEXT;
?>  
</div>
<div id="gameplay">
<?php
  echo "<h2>".GAMEPLAY_TITLE."</h2>";
  echo "<h3>".TIME_TITLE."</h3><hr>";
  echo "<input type='checkbox' name='time' checked='checked'>".ALLOW_TIME."<br>";
  echo SPACER.TIMER_SPEED." <input type='number' name='timer_speed' value='40' min='0' max='255'> ".FRAME." (60 ".FRAMES." = 1 ".SECONDS.")<br>";
  echo "<input type='checkbox' name='timer_speedup' checked='checked'>".TIMER_SPEEDUP."<br>";
  echo "<input type='checkbox' name='timer_kill' checked='checked'>".TIME_KILL."<br>";
  echo SPACER.INTRO_TIMER."<input type='number' name='timer_intro' value='176' min='0' max='255'> ".FRAME." x 4<br>";
  echo SPACER.TIME_PAUSE."<input type='number' name='timer_intro' value='60' min='0' max='255'> ".FRAME."<br>";
  echo SPACER.TIME_PSWITCH."<input type='number' name='timer_pswitch' value='176' min='0' max='255'> ".FRAME."<hr>";
  echo "<h3>".SCORE_TITLE."</h3><hr>";
  echo "<input type='checkbox' name='score_statusbar' checked='checked'>".SCORE_STATUSBAR."<br>";
  echo SPACER.SCORE_3UP."<select name='score_3up'>";
  echo "<option value='0F' selected='selected'>3 ".LIFE." (".STANDARD.")</option>";
  score();
  echo "</select>"."<br>";
  echo SPACER.SCORE_BELOW_HIT."<select name='score_below_hit'>";
  echo scoreBelow();
  echo "</select>";
  echo "<hr>";
  echo "<h3>".COINS_TITLE."</h3><hr>";
  echo "<input type='checkbox' name='coins_give_1up' checked='checked'>".COINS_GIVE_1UP."<br>";
  echo SPACER.COINS_1UP_REMOVE. " <input type='number' name='coins_1up_remove' min='0' max='255' value='100'><br>";
  echo SPACER.COINS_1UP." <input type='number' name='coins_1up' min='0' max='255' value='100'><br>";
  echo "";
  echo "";
  echo "<hr>";
?>
</div>
<div id="sfx">
<?php
  echo DEBUG_TEXT;
?>
</div>
<div id="player">
<?php
  echo DEBUG_TEXT;
?>
</div>
<div id="sprite">
<?php
  echo DEBUG_TEXT;
?>
</div>
<div id="titlescreen">
<?php
  echo DEBUG_TEXT;
?>
</div>
<div id="custom">
<?php
  echo "<h2>".CUSTOM_TITLE."</h2>";
  echo CUSTOM_TEXT."<br><textarea name='custominput'>;".CUSTOM_TEXTBOX."</textarea><br>";
  echo CUSTOM_INFO;
?>
</div>
<div id="end">
<?php
  echo SUBMIT_TEXT."<br/><input type='submit' value='".SUBMIT_BUTTON."'>";
?>
</div>
</form>
<footer>
<?php
  echo "Translation by: ".TRANSLATOR." | Code: W4mp3 | Version: ".VERSION;
  /* Please, PLEASE do not change that line above. I beg you, this thing took some time and 
    proper credit is cool!*/
?>
</footer>
</body>
</html>