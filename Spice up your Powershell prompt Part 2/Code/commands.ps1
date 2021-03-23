#Set a new execution policy
Set-ExecutionPolicy Unrestricted -Force

#Navigate to home folder
cd $HOME

#Install modules
Install-Module oh-my-posh -Force
#If you use Git then this one will be useful
Install-Module posh-git -Force

#you can also get these modules from GitHub and install them manually
#oh-my-posh - https://github.com/JanDeDobbeleer/oh-my-posh
#posh-git   - https://github.com/dahlbyk/posh-git

#Get and install some cool fonts
#Choose from different fonts here: https://www.nerdfonts.com/font-downloads
Invoke-WebRequest -Uri 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip' -OutFile .\DejaVuSansMono.zip
Expand-Archive .\DejaVuSansMono.zip
#Get a module that contains a script to install fonts with Powershell
#The module can be downloaded manually from: https://www.powershellgallery.com/packages/PSWinGlue/0.5.5
Invoke-WebRequest -Uri 'https://github.com/ralish/PSWinGlue/archive/refs/tags/v0.5.5.zip' -OutFile .\PSWinGlue.zip
Expand-Archive .\PSWinGlue.zip
Move-Item .\PSWinGlue\PSWinGlue-0.5.5\Scripts\Install-Font.ps1 .\
#Install the font
.\Install-Font.ps1 -Path '.\DejaVuSansMono\DejaVu Sans Mono Nerd Font Complete Mono Windows Compatible.ttf'

#Clean up after install is done
Remove-Item .\DejaVuSansMono.zip
Remove-Item .\PSWinGlue* -Recurse

#revert to the old execution policy
Set-ExecutionPolicy $Policy -Force

#Set one of the newly installed font in your Powershell console

#Take it for a spin
Import-Module oh-my-posh
#If you use Git
Import-Module posh-git
Set-PoshPrompt agnoster
#See available themes; new themes can be placed in the module directory in Themes
Get-PoshThemes

#To always start Powershell with these settings add commands to your PS profile
#Run from Powershell.exe and not Powershell ISE
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE
#Add the import commands and the set-prompt command in the file
#Close PS and open it again

#Test out git
mkdir git
cd git
git init