
Function Enable-AzConnection {
    
    if (Get-AzContext) {
        Write-Host "
        You are logged in to MS Azure account as a: `n" -ForegroundColor "Green"
        Get-AzContext | fl
    }
    
    else {

        try {
            $User = Read-Host "Please enter your Azure account username"
            $Pass = Read-Host "Please enter your Azure account password" -AsSecureString
            $Cred = New-Object System.Management.Automation.PSCredential($User, $Pass)
            Connect-AzAccount -Credential $Cred -ErrorAction Stop | Out-null
             
            Write-Host "
            You're now logged in to Azure Portal!" -ForegroundColor "Green"
            Get-AzContext | fl
        }
        catch {
            Write-Host "Sorry, your account details are incorrect. Please try again. " -ForegroundColor "Red"
            $Error.Clear()
            Enable-AzConnection  
        }         
    }    
}