
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn-2.webcatalog.io/switchbar/Switchbar%20Setup%2017.1.3.exe'
$url64      = 'https://cdn-2.webcatalog.io/switchbar/Switchbar%20Setup%2017.1.3.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'switchbar*'

  checksum      = 'FF449A16C4DDC21C48D86C7D44273E9CBD1517E1958E11C46F9F3962A33102E8'
  checksumType  = 'sha256'
  checksum64    = 'FF449A16C4DDC21C48D86C7D44273E9CBD1517E1958E11C46F9F3962A33102E8'
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

# prevents warning pop-up if process already exists
Stop-Process -Name Switchbar -ErrorAction SilentlyContinue
Install-ChocolateyPackage @packageArgs