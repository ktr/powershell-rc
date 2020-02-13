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

# doskey /exename=powershell.exe /MACROFILE=H:/bin/bashrc.ps1
# doskey /exename=powershell.exe c=clear
# doskey /exename=powershell.exe x=exit
# doskey /exename=powershell.exe i=ipython

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

New-Alias c clear
New-Alias i ipython
function x{exit}

Set-PSReadLineOption -EditMode Emacs
