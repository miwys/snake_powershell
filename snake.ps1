
function DrawTheSnake
{
  $rui.cursorposition = $tail[0]
  write-host -foregroundcolor white -backgroundcolor darkmagenta -NoNewline " " 
  for ($i=0; $i -lt ($tailLength - 1); $i++)
  {
    $tail[$i].x = $tail[$i+1].x
    $tail[$i].y = $tail[$i+1].y
  }
 
  $tail[-1].x = $coord.x
  $tail[-1].y = $coord.y
   
  for ($i=0; $i -lt $tailLength; $i++)
  {
    $rui.cursorposition = $tail[$i]
    write-host -foregroundcolor white -backgroundcolor white -NoNewline " "
  }

}

function DrawTheSnake2
{
  

  $rui.cursorposition = $tail2[0]
  write-host -foregroundcolor white -backgroundcolor darkmagenta -NoNewline " " 

  for ($i=0; $i -lt ($tail2Length - 1); $i++)
  {
    $tail2[$i].x = $tail2[$i+1].x
    $tail2[$i].y = $tail2[$i+1].y
  }
 
 
  $tail2[-1].x = $coord2.x
  $tail2[-1].y = $coord2.y
  
 
  for ($i=0; $i -lt $tail2Length; $i++)
  {
    $rui.cursorposition = $tail2[$i]
    write-host -foregroundcolor red -backgroundcolor red -NoNewline " "
  }


}

function MoveTheApple
{ 
  $ok = $true;
  do 
  {
    $script:apple.x = get-random -min 2 -max ($rui.WindowSize.width - 2)
    $script:apple.y = get-random -min 2 -max ($rui.WindowSize.height - 2)
    $ok=$true
    for ($i=0; $i -lt $tailLength; $i++)
    {
      if (($tail[$i].x -eq $apple.x) -and ($tail[$i].y -eq $apple.y))
      {
        $ok=$false;
      }
    }
    
    for ($i=0; $i -lt $tail2Length; $i++)
    { 
      if (($tail2[$i].x -eq $apple.x) -and ($tail2[$i].y -eq $apple.y))
      {
        $ok=$false;
      }
    }
  
  } While (!$ok)
}

function MoveTheApple2
{ 
  $ok = $true;
  do 
  {
    $script:apple.x = get-random -min 2 -max ($rui.WindowSize.width - 2)
    $script:apple.y = get-random -min 2 -max ($rui.WindowSize.height - 2)
    $ok=$true
    for ($i=0; $i -lt $tailLength; $i++)
    {
      if (($tail[$i].x -eq $apple.x) -and ($tail[$i].y -eq $apple.y))
      {
        $ok=$false;
      }
    }
    
    for ($i=0; $i -lt $tail2Length; $i++)
    { 
      if (($tail2[$i].x -eq $apple.x) -and ($tail2[$i].y -eq $apple.y))
      {
        $ok=$false;
      }
    }
  
  } While (!$ok)
}
function GoThrough
{
  if($coord.x -eq -1)
  {
    $coord.x = $host.ui.rawui.windowsize.width-1;
  }
  if($coord.y -eq -1)
  {
    $coord.y = $host.ui.rawui.windowsize.height-1;
  }
  if($coord.x -eq $host.ui.rawui.windowsize.width)
  {
    $coord.x = 0;
  }
  if($coord.y -eq $host.ui.rawui.windowsize.height)
  {
    $coord.y = 0;
  }

 
  if($coord2.x -eq -1)
  {
    $coord2.x = $host.ui.rawui.windowsize.width-1;
  }
  if($coord2.y -eq -1)
  {
    $coord2.y = $host.ui.rawui.windowsize.height-1;
  }
  if($coord2.x -eq $host.ui.rawui.windowsize.width)
  {
    $coord2.x = 0;
  }
  if($coord2.y -eq $host.ui.rawui.windowsize.height)
  {
    $coord2.y = 0;
  }
  

}

function GoThrough2
{

  if($coord.x -eq -1)
  {
    $coord.x = $host.ui.rawui.windowsize.width-1;
  }
  if($coord.y -eq -1)
  {
    $coord.y = $host.ui.rawui.windowsize.height-1;
  }
  if($coord.x -eq $host.ui.rawui.windowsize.width)
  {
    $coord.x = 0;
  }
  if($coord.y -eq $host.ui.rawui.windowsize.height)
  {
    $coord.y = 0;
  }
  if($coord2.x -eq -1)
  {
    $coord2.x = $host.ui.rawui.windowsize.width-1;
  }
  if($coord2.y -eq -1)
  {
    $coord2.y = $host.ui.rawui.windowsize.height-1;
  }
  if($coord2.x -eq $host.ui.rawui.windowsize.width)
  {
    $coord2.x = 0;
  }
  if($coord2.y -eq $host.ui.rawui.windowsize.height)
  {
    $coord2.y = 0;
  }
}

function DrawTheApple
{
  $rui.CursorPosition = $apple
  write-host -foregroundcolor white -backgroundcolor darkmagenta "@"
}

function CheckAppleHit
{
  
  if (($tail[-1].x -eq $apple.x) -and ($tail[-1].y -eq $apple.y))
  {
    
    MoveTheApple
    
    $script:score += 1
    
    # dodaje fragment i aktalizuje jego pozycje
    $script:tailLength++
    $script:tail += new-object System.Management.Automation.Host.Coordinates
    $script:tail[-1].x = $coord.x
    $script:tail[-1].y = $coord.y
  }
}
function CheckAppleHit2
{
  
  if (($tail[-1].x -eq $apple.x) -and ($tail[-1].y -eq $apple.y))
  {
    
    MoveTheApple2
    
    #$score += 1
    
    # dodaje fragment i aktalizuje jego pozycje
    $script:tailLength++
    $script:tail += new-object System.Management.Automation.Host.Coordinates
    $script:tail[-1].x = $coord.x
    $script:tail[-1].y = $coord.y
  }
  
  if (($tail2[-1].x -eq $apple.x) -and ($tail2[-1].y -eq $apple.y))
  {
    
    MoveTheApple2
    
    #$score2 += 1
    
    # dodaje fragment i aktalizuje jego pozycje
    $script:tail2Length++
    $script:tail2 += new-object System.Management.Automation.Host.Coordinates
    $script:tail2[-1].x = $coord2.x
    $script:tail2[-1].y = $coord2.y
  }
}

function CheckSnakeBodyHits
{
  for ($i=0; $i -lt $tailLength -1; $i++)
  {
    if (($tail[$i].x -eq $coord.x) -and ($tail[$i].y -eq $coord.y)) 
    {
      cls
      write-host -foregroundcolor white "GAMEOVER score: $score"
      exit
    }
  }
}
function CheckSnakeBodyHits2
{
  for ($i=0; $i -lt $tailLength -1; $i++)
  {
    if (($tail[$i].x -eq $coord.x) -and ($tail[$i].y -eq $coord.y)) 
    {
      cls
      write-host -foregroundcolor white "WINNER: PLAYER 2"
      exit
    }
  }
 
  for ($i=0; $i -lt $tail2Length -1; $i++)
  {
    if (($tail2[$i].x -eq $coord.x) -and ($tail2[$i].y -eq $coord.y)) 
    {
      cls
      write-host -foregroundcolor white "WINNER: PLAYER 2"
      exit
    }
  }
  for ($i=0; $i -lt $tail2Length -1; $i++)
  {
    if (($tail2[$i].x -eq $coord2.x) -and ($tail2[$i].y -eq $coord2.y))
    {
      cls
      write-host -foregroundcolor white "WINNER: PLAYER 1"
      exit
    }
  }
  for ($i=0; $i -lt $tailLength -1; $i++)
  {
    if (($tail[$i].x -eq $coord2.x) -and ($tail[$i].y -eq $coord2.y)) 
    {
      cls
      write-host -foregroundcolor white "WINNER: PLAYER 1"
      exit
    }
  
}
}

function drawwall
{
  $wallsize = 12
  $w = $host.ui.rawui.windowsize.width
  $h = $host.ui.rawui.windowsize.height
  $j = 0

  for($i=0; $i -lt $wallsize; $i++)########1
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w/5
    $script:wall[-1].y = $h/5 + $i
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w/5 + $i
    $script:wall[-1].y = $h/5 
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)########2
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w/5 + $i
    $script:wall[-1].y = $h - $h/5
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w/5
    $script:wall[-1].y = $h - $h/5 - $i  
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)########3
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w - $w/5 - $i
    $script:wall[-1].y = $h/5
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w - $w/5
    $script:wall[-1].y = $h/5 + $i  
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)########4
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w - $w/5 - $i
    $script:wall[-1].y = $h - $h/5
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
  for($i=0; $i -lt $wallsize; $i++)
  {
    $script:wall += new-object System.Management.Automation.Host.Coordinates
    $script:wall[-1].x = $w - $w/5
    $script:wall[-1].y = $h - $h/5 - $i  
    $host.ui.rawui.cursorposition = $wall[$j]
    write-host -foregroundcolor black -backgroundcolor white -nonewline "#"
    $j++
  }
}
function hitwall
{
for($i=0; $i -lt $script:wall.count; $i++){
  if(($coord.x -eq $script:wall[$i].x) -and ($coord.y -eq $script:wall[$i].y)){
    cls
    write-host -foregroundcolor white "GAMEOVER score: $score"
    exit
  }
}
}

function hitwall2
{
for($i=0; $i -lt $script:wall.count; $i++){
  if(($coord.x -eq $script:wall[$i].x) -and ($coord.y -eq $script:wall[$i].y)){
    cls
    write-host -foregroundcolor white "WINNER: PLAYER 2"
    exit
  }
 
  
  if(($coord2.x -eq $script:wall[$i].x) -and ($coord2.y -eq $script:wall[$i].y)){
    cls
    write-host -foregroundcolor white "WINNER: PLAYER 1"
    exit
  }
  
}
}
function steering
{
  if ([Console]::KeyAvailable)
        {
            $key = [System.Console]::ReadKey($true)
            switch ($key.Key)
            {
                LeftArrow { if($script:dir -ne 2) {$script:dir = 0}; break }
                RightArrow { if($script:dir -ne 0) {$script:dir = 2}; break }
                UpArrow { if($script:dir -ne 3) {$script:dir = 1}; break }
                DownArrow { if($script:dir -ne 1) {$script:dir = 3}; break }

            }
        }
        
        if ($dir -eq 0){$coord.x--}
        if ($dir -eq 1){$coord.y--}
        if ($dir -eq 2){$coord.x++}
        if ($dir -eq 3){$coord.y++}  
   
}
function steering2
{
  if ([Console]::KeyAvailable)
        {
            $key = [System.Console]::ReadKey($true)
            switch ($key.Key)
            {
                LeftArrow { if($script:dir -ne 2) {$script:dir = 0}; break }
                RightArrow { if($script:dir -ne 0) {$script:dir = 2}; break }
                UpArrow { if($script:dir -ne 3) {$script:dir = 1}; break }
                DownArrow { if($script:dir -ne 1) {$script:dir = 3}; break }
                A { if($script:dir2 -ne 2) {$script:dir2 = 0}; break }
                D { if($script:dir2 -ne 0) {$script:dir2 = 2}; break }
                W { if($script:dir2 -ne 3) {$script:dir2 = 1}; break }
                S { if($script:dir2 -ne 1) {$script:dir2 = 3}; break }
            }
        }
        
        if ($dir -eq 0){$coord.x--}
        if ($dir -eq 1){$coord.y--}
        if ($dir -eq 2){$coord.x++}
        if ($dir -eq 3){$coord.y++}  
        if ($dir2 -eq 0){$coord2.x--}
        if ($dir2 -eq 1){$coord2.y--}
        if ($dir2 -eq 2){$coord2.x++}
        if ($dir2 -eq 3){$coord2.y++}    
}

function choise
{ write-host -foregroundcolor white -backgroundcolor DarkMagenta -nonewline "SNAKE GAME" "`r`n" 
  write-host -foregroundcolor white -backgroundcolor DarkMagenta -nonewline "1 - one player" "`r`n" 
  write-host -foregroundcolor white -backgroundcolor DarkMagenta -nonewline "2 - one player with obsacles" "`r`n"
  write-host -foregroundcolor white -backgroundcolor DarkMagenta -nonewline "3 - two players" "`r`n"
  write-host -foregroundcolor white -backgroundcolor DarkMagenta -nonewline "4 - two players with obsacles" "`r`n"
  $input = Read-Host "Please make a selection"
  switch ($input)
  {
      1 {cls; game;}
      2 {cls;drawwall;game;}
      3 {cls;game2;}
      4 {cls;drawwall;game2;} 
      
  }
}

function game
{ 
  MoveTheApple;
  while ($true)
{  
  steering;
  GoThrough;
  DrawTheApple;
  DrawTheSnake;
  hitwall;
  CheckSnakeBodyHits;
  CheckAppleHit;
    
  start-sleep -mil 20
  
}
}

function game2
{ 
  MoveTheApple;
  while ($true)
{  
  steering2;
  GoThrough2;
  DrawTheApple;
  DrawTheSnake;
  DrawTheSnake2;
  hitwall2;
  CheckSnakeBodyHits2;
  CheckAppleHit2;
    
  start-sleep -mil 20
}

}
################### MAIN ####################
$ui=(get-host).ui
$rui=$ui.rawui

cls
####################################1
$coord = $rui.CursorPosition
$score = 0
$dir = 0
$coord.x = 100
$coord.y = 25

$tail = @()
$tailLength = 10

for ($i=0; $i -lt $tailLength; $i++)
{
  $tail += new-object System.Management.Automation.Host.Coordinates
  $tail[$i].x = $coord.x
  $tail[$i].y = $coord.y
}
####################################2

  $coord2 = $rui.CursorPosition
  #$score2 = 0
  $dir2 = 2
  $coord2.x = 20
  $coord2.y = 25
  
  $tail2 = @()
  $tail2Length = 10
  
  for ($i=0; $i -lt $tail2Length; $i++)
  {
    $tail2 += new-object System.Management.Automation.Host.Coordinates
    $tail2[$i].x = $coord2.x
    $tail2[$i].y = $coord2.y
  }


######################################
$wall = @()
$apple = new-object System.Management.Automation.Host.Coordinates
choise;