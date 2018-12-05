function Show-Menu
{
     param (
           [string]$Title = 'Team 2 Guldan Migration'
     )
     cls
     Write-Host "-----------------------------------------------------------------------------------------------------"
     Write-Host "    __      __                 __                                                                    "
     Write-Host "   / /___ _/ /_     ________  / /___  ______                                                         "
     Write-Host "  / / __ `/ __ \   / ___/ _ \/ __/ / / / __ \                                                        "
     Write-Host " / / /_/ / /_/ /  (__  )  __/ /_/ /_/ / /_/ /                                                        " 
     Write-Host "/_/\__,_/_.___/  /____/\___/\__/\__,_/ .___/                                                         "
     Write-Host "-----------------------------------------------------------------------------------------------------"
     Write-Host "Q: Press 'Q' to quit."
     Write-Host "0: Press '0' Rename Computer."
     Write-Host "1: Press '1' Add Computer."
     Write-Host "2: Press '2' Add IP address."
     Write-Host "3: Press '3' Modify DNS."
     Write-Host "4: Press '4' Install New Forrest"
     Write-Host "5: Press '5' install git"
     Write-Host "5: Press '6' Remove SPN"

}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
        'q' {
            return
           }'0' {
                $add_servername     = Read-Host -Prompt 'input your server name'
                Rename-Computer -NewName $add_servername -Force -Restart
           } '1' {
                $add_domainname     = Read-Host -Prompt 'input your domain name'
                add-Computer -Domain $add_domainname -Force -Restart
           } '2' {
                $add_IPv4Address    = Read-Host -Prompt 'input your ip address'
                $add_prefixlength   = Read-Host -Prompt 'input your prefix '
                $add_DefaultGateway = Read-Host -Prompt 'input default gateway'

                Set-NetIPAddress -InterfaceAlias "Ethernet" -IPv4Address $add_IPv4Address -PrefixLength $add_prefixlength -DefaultGateway $add_DefaultGateway
           } '3' {
                Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.0.240, 1.1.1.1
           } '4' {
                install-windowfeature AD-Domain-Services
                Import-Module ADDSDeployment
                Install-ADDSForest -InstallDns:$true -CreateDnsDelegation:$true -DatabasePath -C:\Windows\NTDS- -DomainMode -Win2012R2- -DomainName -stormwind.destory- -DomainNetbiosName -stormwind- -ForestMode -Win2012R2- -InstallDns:$true -LogPath -C:\Windows\NTDS- -NoRebootOnCompletion:$false -SysvolPath -C:\Windows\SYSVOL--Force:$true 
           } '5' {
                cmd /c choco install git -y
           } '6' {
                
           } '7' {
               
           }
     }
     pause
}
until ($input -eq 'q')
