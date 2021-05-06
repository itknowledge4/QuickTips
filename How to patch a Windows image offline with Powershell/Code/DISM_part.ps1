#Create folder where the image will be mounted
mkdir C:\mount
$MountDir='C:\mount'

Get-WindowsImage -ImagePath 'C:\install.wim'
Mount-WindowsImage -Path $mountdir -ImagePath C:\install.wim -Index 1
foreach($upd in $UpdateFiles){ Add-WindowsPackage -PackagePath $upd -Path $mountdir }
Dismount-WindowsImage -Path $mountdir -Save


