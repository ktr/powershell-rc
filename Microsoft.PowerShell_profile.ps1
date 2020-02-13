# To create this file:
# New-Item $profile -Type File -Force

Function Test-Elevated {
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}

# If (Test-Elevated) {
#   echo "Be careful!"
# } Else {
#   echo "Eh, do whatever."
# }

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

New-Alias c clear
New-Alias i ipython
New-Alias which get-command
function x{exit}
New-Alias ssh-agent Start-Ssh-Agent

Set-PSReadLineOption -EditMode Emacs

Import-Module "H:\lib\posh-git\src\posh-git.psd1"
# Set-Alias ssh-agent "$env:LOCALAPPDATA\Programs\Git\usr\bin\ssh-agent.exe"
# Set-Alias ssh-add "$env:LOCALAPPDATA\Programs\Git\usr\bin\ssh-add.exe"
