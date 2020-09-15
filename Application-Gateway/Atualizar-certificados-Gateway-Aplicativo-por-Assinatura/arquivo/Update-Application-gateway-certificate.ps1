######################################################################################
###
###  Title         : Update Application Gateway Certificate 
###  Programmed by : Rodolfo Urbano Rodrigues
###  Date          : September, 2020
###
###  Scripts for updating Signature Application Gateway certificates
###
###
###
######################################################################################

### Solicitando o login no azure
Disconnect-AzAccount | Out-Null
Connect-AzAccount | Out-Null

$subscriptions = ("subscriptions-01","subscriptions-02") 
$ArquivoDoCertificado = "C:\certificado.pfx"
$SenhaDoCertificado = "********"
$password = ConvertTo-SecureString $SenhaDoCertificado -AsPlainText -Force

# Loop through all subscriptions
foreach($subscriptionName in $subscriptions) {    
    
    $objSubscription = Select-AzSubscription -SubscriptionName $subscriptionName  
    Write-Host  "Subscription: ["$($objSubscription.Subscription.Name)"] selected " -ForegroundColor Cyan;   

    #Loop through all Application Gateway with filter for name
    $AppGwList = Get-AzApplicationGateway | where {($_.Name -like "*Name_Application_Gateway*"}  

    if($AppGwList){

        foreach($appGwlist in $AppGwList) {
        
            Write-Host  "ResourceGroup: ["$($appGwlist.ResourceGroupName)"] selected" -ForegroundColor Yellow;

            #Obtaining the application gateway and filling in the variable $ag
            $AppGW = Get-AzApplicationGateway -Name $appGwlist.Name -ResourceGroup $appGwlist.ResourceGroupName
            Write-Host  "Application Gateway: ["$($AppGW.Name)"] selected" -ForegroundColor White;
        
            #Get a list of SSL certificates with a filter for the certificate name, if you have more than one.
            $Certs = Get-AzApplicationGatewaySslCertificate -ApplicationGateway $AppGW  | where {($_.Name -like "*lgrh.com.br")}  

            if($Certs){

                Write-Host  "Get SSL certificates: ["$($Certs.Name)"] selected" -ForegroundColor Green;

                    foreach($objcerts in $Certs) {

                        #Removing the update certificate
                        Write-Host  "ApplicationGatewaySslCertificate: ["$($objcerts.Name)"] Remove" -ForegroundColor Green;
                        Remove-AzApplicationGatewaySslCertificate -ApplicationGateway $AppGW -Name $Certs.Name | Out-Null
                

                        #Adding the new certificate
                        Write-Host  "ApplicationGatewaySslCertificate: ["$($objcerts.Name)"] Add" -ForegroundColor Green;
                        Add-AzApplicationGatewaySslCertificate -ApplicationGateway $AppGW -Name $Certs.Name -CertificateFile $ArquivoDoCertificado -Password $password | Out-Null
                    }

                #Performing the certificate exchange in azure
                Write-Host  "Performing the  ["$($Certs.Name)"] certificate update on ["$($appGwlist.Name)"]" -ForegroundColor Magenta;
                Set-AzApplicationGateway -ApplicationGateway $AppGW | Out-Null
            
            }else {
                Write-Host "The parameters did not meet the filter: Certificate" -ForegroundColor Red;
            }
        }
    }else {
        Write-Host "The parameters did not meet the filter: ApplicationGateway" -ForegroundColor Red;
    }
}