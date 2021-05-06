#Change for your environment
$WSUSServer='WSUS01'
$TargetOS='Windows Server 2016'

#If the server on which you run the script does not have WSUS tools installed run:
Install-WindowsFeature UpdateServices-API

mkdir C:\Updates
$LocalUpdates='C:\Updates'

$WSUS=Get-WsusServer -Name $WSUSServer -PortNumber 8530
$AllUpdates=$WSUS.GetUpdates()

$WSUSUpdates=$AllUpdates | Where-Object {$TargetOS -in $_.ProductTitles -and $_.IsApproved -eq $true -and $_.IsSuperseded -eq $false}

foreach($Update in $WSUSUpdates)
{
    $CabUris=$Update.GetInstallableItems() | Select-Object -ExpandProperty Files | Where-Object {$_.Type -eq 'SelfContained'} | Select-Object -ExpandProperty FileUri | Select-Object -ExpandProperty AbsoluteUri
    foreach($CabUri in $CabUris)
    {
        $CabName=$CabUri | Split-Path -Leaf
        $CabUriPath=$CabUri.Replace('/','\').Replace('http:','').Replace(':8530','\C$').Replace('Content','WSUS\WsusContent')
        Copy-Item $CabUriPath $LocalUpdates
    }
}

$UpdateFiles=Get-ChildItem $LocalUpdates | Select-Object -ExpandProperty FullName