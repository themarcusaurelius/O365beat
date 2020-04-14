# Delete and stop the service if it already exists.
if (Get-Service o365beat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='o365beat'"
  $service.StopService()
  Start-Sleep -s 1
  $service.delete()
}
