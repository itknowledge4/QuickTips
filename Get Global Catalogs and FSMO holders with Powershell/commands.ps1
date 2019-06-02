#Get a list of all Domain Controllers
Get-ADDomainController -Filter * | Select-Object Name
#Get a list of all Domain Controllers that are Global Catalogs
Get-ADDomainController -Filter {IsGlobalCatalog -eq $True}
#Get a list of Domain Controllers that hold at least a FSMO role
Get-ADDomainController -Filter {OperationMasterRoles -ne ''}

#Get a list of the holders for domain level FSMO roles
Get-ADDomain | Select-Object InfrastructureMaster,PDCEmulator,RIDMaster
#Get a list of forest level FSMO roles
Get-ADForest | Select-Object DomainNamingMaster,SchemaMaster
#Get all global catalogs from the forest
Get-ADForest | Select-Object -ExpandProperty GlobalCatalogs