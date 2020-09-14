# ![AzureIcon](imagens/MicrosoftAzure-32px.png) ![PowershellIcon](imagens/MicrosoftPowerShellCore-32px.png) Microsoft Azure PowerShell

Este repositório contém cmdlets do PowerShell para implantar e gerenciar aplicativos do Microsoft Azure.

Experimente no Azure Cloud Shell

[![CloudShellIcon](https://shell.azure.com/images/launchcloudshell.png)](https://shell.azure.com/powershell)

## Modules
Abaixo está uma tabela contendo nosso módulo de rollup do Azure PowerShell.

Descrição       | Nome do Módulo  | PowerShell Gallery Link
----------------- | ------------ | -----------------------
Azure PowerShell  | `Az`         | [![Az](https://img.shields.io/powershellgallery/v/Az.svg?style=flat-square&label=Az)](https://www.powershellgallery.com/packages/Az/4.5.0)




## Installation

### PowerShell Gallery

Execute o seguinte comando em uma sessão elevada do PowerShell para instalar o módulo de rollup para cmdlets do Azure PowerShell:

```powershell
Install-Module -Name Az
```

Este módulo é executado no Windows PowerShell com [.NET Framework 4.7.2](https://dotnet.microsoft.com/download/dotnet-framework-runtime) ou superior, ou PowerShell Core. O módulo `Az` substitui` AzureRM`. Você não deve instalar o `Az` lado a lado com o` AzureRM`.

Se você tiver uma versão anterior dos módulos do Azure PowerShell instalados na Galeria do PowerShell e quiser atualizar para a versão mais recente, execute os seguintes comandos em uma sessão elevada do PowerShell:

```powershell
Update-Module -Name Az
```

`Update-Module` instala a nova versão lado a lado com as versões anteriores. Não desinstala as versões anteriores.

Para obter instruções detalhadas sobre a instalação do Azure PowerShell, consulte o [guia de instalação](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps).
