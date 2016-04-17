# delete service if it exists
if (Get-Service topbeat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='topbeat'"
  $service.delete()
}
