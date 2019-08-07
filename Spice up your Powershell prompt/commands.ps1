#Install modules
Install-Module oh-my-posh
Install-Module posh-git #needed if you use Git (you will also need the Git client)

#you can also get these modules from GitHub and install them manually
#oh-my-posh - https://github.com/JanDeDobbeleer/oh-my-posh
#posh-git   - https://github.com/dahlbyk/posh-git

#Get and install some cool fonts
Invoke-WebRequest -Uri 'https://github.com/powerline/fonts/archive/master.zip' -OutFile .\powerlinefonts.zip
Expand-Archive .\powerlinefonts.zip
.\powerlinefonts\fonts-master\install.ps1
#Clean up after install is done
Remove-Item .\powerlinefonts.zip
Remove-Item .\powerlinefonts -Recurse

#Set one of the newly installed fonts in your Powershell console
#For powershell.exe I use DejaVu Sans Mono for Powerline
#For powershell in Windows Terminal I use Inconsolata for Powerline
#Note: not all fonts work in Windows Terminal for now; see list in gitHub repo

#Take it for a spin
Import-Module oh-my-posh
Import-Module posh-git #If you use git
Set-Theme Agnoster
#See available themes; new themes can be placed in the directory
Get-Theme
Set-Theme MyTheme

#To always start Powershell with these settings add commands to your PS profile
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE
#Add the 3 commands (or others) to the file and save
#Close PS and open it again