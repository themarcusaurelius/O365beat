# Delete and stop the service if it already exists.
if (Get-Service o365beat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='o365beat'"
  $service.StopService()
  Start-Sleep -s 1
  $service.delete()
}

$workdir = Split-Path $MyInvocation.MyCommand.Path

# Create the new service.
New-Service -name o365beat `
  -displayName O365beat `
  -binaryPathName "`"$workdir\o365beat.exe`" -c `"$workdir\o365beat.yml`" -path.home `"$workdir`" -path.data `"C:\ProgramData\o365beat`" -path.logs `"C:\ProgramData\o365beat\logs`""

# Attempt to set the service to delayed start using sc config.
Try {
  Start-Process -FilePath sc.exe -ArgumentList 'config o365beat start=delayed-auto'
}
Catch { Write-Host "An error occured setting the service to delayed start." -ForegroundColor Red }
