#Install the C Runtime
Start-Process wusa.exe -ArgumentList "C:\Tools\WindowsUCRT\Windows8-RT-KB3118401-x64.msu",'/quiet','/norestart' -Wait
#Install WMF 5.1
Start-Process wusa.exe -ArgumentList "C:\Tools\W2K12-KB3191565-x64.msu",'/quiet','/norestart' -Wait
#A restart is needed after WMF 5.1 has been installed
Restart-Computer
#Install Powershell 7
Start-Process msiexec.exe -ArgumentList "/package C:\Tools\PowerShell-7.0.0-win-x64.msi","/quiet","ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1" -Wait
#Disable Update Notification
$Env:POWERSHELL_UPDATECHECK = 'Off'

#Test remoting
Enter-PSSession -ComputerName DC02 -ConfigurationName PowerShell.7.0.0