# Automatic Talking Twister Spinner - Compact PowerShell version - By Andrew Bedno
Add-Type -AssemblyName System.Speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.selectVoice('Microsoft Zira Desktop')
$speak.Rate=-3;  $speak.Volume=100;
$TwisterPhrasePrev = ""
while ($true) {
  $RandSide = Get-Random -Maximum 100
  if ($RandSide -le 50) { $TwisterPhrase = "Left " } else { $TwisterPhrase = "Right " }
  $RandLimb = Get-Random -Maximum 100
  if ($RandLimb -le 50) { $TwisterPhrase += "hand " } else { $TwisterPhrase += "foot " }
  $RandColor = Get-Random -Maximum 100
  if ($RandColor -le 25) { $TwisterPhrase += "green." } elseif ($RandColor -le 50) { $TwisterPhrase += "yellow."  } elseif ($RandColor -le 75) { $TwisterPhrase += "blue."  } else { $TwisterPhrase += "red." }
  if ($TwisterPhrasePrev -ne $TwisterPhrase) {
    $TwisterPhrasePrev = $TwisterPhrase
    Write-Host $TwisterPhrase
    $speak.Speak($TwisterPhrase)
    timeout /t 15
  }    
}