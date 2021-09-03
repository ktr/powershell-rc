# vim: softtabstop=2 shiftwidth=2 :
#
# To create this file:
# New-Item $profile -Type File -Force

Function Test-Elevated {
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}

Function Set-DefaultBrowser ($browserU) {
  If ($browserU -eq "chrome") {
    $browser = "google%chrome"
  } ElseIf ($browserU -eq "edge") {
    $browser = "msedge.exe"
  } Else {
    $browser = $browserU
  }
  $cmd = '/name Microsoft.DefaultPrograms /page pageDefaultProgram\pageAdvancedSettings?pszAppName=' + $browser
  Add-Type -AssemblyName 'System.Windows.Forms'
  Start-Process $env:windir\system32\control.exe -ArgumentList $cmd
  Sleep 3
  [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER} ")
}

# If (Test-Elevated) {
#   echo "Be careful!"
# } Else {
#   echo "Eh, do whatever."
# }

Set-PSReadLineOption -EditMode Emacs

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

New-Alias c clear
New-Alias i ipython
New-Alias which get-command

Set-Alias -Name vi -Value nvim.exe
Set-Alias -Name vim -Value nvim-qt.exe

function .. {cd ..}
function x  {exit}
function title ($title) { $host.ui.RawUI.WindowTitle = $title }

Function activate ($env) {
  $p1 = "H:\.envs\$env\Scripts\Activate.ps1"
  $p2 = "C:\Users\kryan\.envs\$env\Scripts\Activate.ps1"
  If (Test-Path $p1) {
    echo "Activating $p1"
    & $p1
  } ElseIf (Test-Path $p2) {
    echo "Activating $p2"
    & $p2
  } Else {
    echo "Cannot find environment $env"
  }
}

function Github {
  Import-Module "H:\lib\posh-git\src\posh-git.psd1"
  Start-Ssh-Agent -Quiet
}

# Set-Alias ssh-agent "$env:LOCALAPPDATA\Programs\Git\usr\bin\ssh-agent.exe"
# Set-Alias ssh-add "$env:LOCALAPPDATA\Programs\Git\usr\bin\ssh-add.exe"

function c {
  cls
}

function x {
  exit
}

Invoke-Expression (&starship init powershell)
