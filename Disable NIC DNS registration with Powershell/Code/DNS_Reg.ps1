#Disable DNS registration for a net adapter
Set-DnsClient -InterfaceIndex 12 -RegisterThisConnectionsAddress 0
#Enable DNS registration for a net adapter
Set-DnsClient -InterfaceIndex 12 -RegisterThisConnectionsAddress 1