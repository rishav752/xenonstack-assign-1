# delete service if it already exists
if (Get-Service topbeat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='topbeat'"
  $service.StopService()
  Start-Sleep -s 1
  $service.delete()
}

$workdir = Split-Path $MyInvocation.MyCommand.Path

# create new service
New-Service -name topbeat `
  -displayName topbeat `
  -binaryPathName "`"$workdir\\topbeat.exe`" -c `"$workdir\\topbeat.yml`""
