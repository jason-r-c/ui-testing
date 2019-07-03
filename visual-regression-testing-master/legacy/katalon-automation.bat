@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install -y unzip

choco install -y curl

curl -O http://ipv4.download.thinkbroadband.com/5MB.zip

ren katalon_studio* katalon_studio.zip

unzip katalon_studio.zip

ren katalon_studio* katalon_studio
