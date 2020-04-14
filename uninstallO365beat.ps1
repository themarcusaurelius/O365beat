Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Set-ExecutionPolicy Unrestricted

    #Change Directory to o365beat
    Set-Location -Path 'c:\o365beat-master\o365beat'

    #Stops o365beat from running
    Stop-Service -Force o365beat

    #Get The o365beat Status
    Get-Service o365beat

    #Change Directory to o365beat5
    Set-Location -Path 'c:\'

    "`nUninstalling O365beat Now..."

    $Target = "C:\o365beat-master"

    Get-ChildItem -Path $Target -Recurse -force |
        Where-Object { -not ($_.pscontainer)} |
            Remove-Item -Force -Recurse

    Remove-Item -Recurse -Force $Target

    "`nO365beat Uninstall Successful."

    #Close Powershell window
    Stop-Process -Id $PID
}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}