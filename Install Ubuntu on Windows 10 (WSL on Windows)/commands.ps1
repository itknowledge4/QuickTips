#This file contains commands and instructions for installing Linux distributions on Windows for through WSL

# 1. First we need to enable the WSL optional feature and restart the computer
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Restart-Computer

# 2. Create a folder where the Linux distribution will be placed and executed from
New-Item C:\Distros -ItemType Directory
Set-Location C:\Distros

# 3. Use one of the commands below to download the distribution of your choice (I will go with the first one)
#  Ubuntu 18.04
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile .\Ubuntu.appx -UseBasicParsing
#  Ubuntu 16.04
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile .\Ubuntu.appx -UseBasicParsing
#  Debian GNU Linux
Invoke-WebRequest -Uri https://aka.ms/wsl-debian-gnulinux -OutFile .\Debian.appx -UseBasicParsing
#  Kali Linux
Invoke-WebRequest -Uri https://aka.ms/wsl-kali-linux -OutFile .\Kali.appx -UseBasicParsing
#  OpenSUSE
Invoke-WebRequest -Uri https://aka.ms/wsl-opensuse-42 -OutFile .\SUSE.appx -UseBasicParsing
#  SLES
Invoke-WebRequest -Uri https://aka.ms/wsl-sles-12 -OutFile .\SLES.appx -UseBasicParsing

# 4. Rename and extract the distro file
Rename-Item .\Ubuntu.appx .\Ubuntu.zip
Expand-Archive .\Ubuntu.zip

# 5. Clean up
Remove-Item ".\Ubuntu.*"

# 6. Install the Linux distribution
#  Make sure you do not forget the passwor that you will enter at the prompt as that is your root password
Set-Location .\Ubuntu
.\ubuntu1804.exe

#To run the WSL shell after the installation just run one of the following
wsl.exe
bash.exe
ubuntu1804.exe #from the distro install directory