#To create an IFM in interactive mode
ntdsutil
activate instance ntds
ifm
create sysvol full <path>
#Then copy the folde to the new server that will be promoted
#To see more options just type ?

#To create an IFM in one command
ntdsutil "activate instance ntds" ifm "create sysvol Full <path>" q q q