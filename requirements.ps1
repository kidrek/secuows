
$arch = "arm64"
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$url = (Invoke-WebRequest -Uri 'https://www.python.org/downloads/windows/').Content | Select-String -Pattern `"https://www.python.org/ftp/python/\d+\.\d+\.\d+/python-\d+\.\d+\.\d+-$arch\.exe`" -AllMatches | % { `$_.Matches[0].Value }; $path = `$env:USERPROFILE\Downloads\ + (`$url -split '/')[-1]; Invoke-WebRequest -Uri `$url -OutFile $path; if ((Read-Host 'Install? (Y/N)') -ieq 'y') { Start-Process -FilePath $path -Wait }`"" -Verb RunAs } else { $url = (Invoke-WebRequest -Uri 'https://www.python.org/downloads/windows/').Content | Select-String -Pattern "https://www.python.org/ftp/python/\d+\.\d+\.\d+/python-\d+\.\d+\.\d+-$arch\.exe" -AllMatches | % { $_.Matches[0].Value }; $path = "$env:USERPROFILE\Downloads\" + ($url -split '/')[-1]; Invoke-WebRequest -Uri $url -OutFile $path; if ((Read-Host "Install? (Y/N)") -ieq 'y') { Start-Process -FilePath $path -Wait }}

