#Important: You can install the Hyper-V role and management tools on a 2012/2012R2 VM but cannot run virtual machines because it does not guest support nested virtualization (if the VM is on Hyper-V)

Enable-WindowsOptionalFeature –Online -FeatureName Microsoft-Hyper-V –All -NoRestart
Install-WindowsFeature RSAT-Hyper-V-Tools -IncludeAllSubFeature
Restart-Computer