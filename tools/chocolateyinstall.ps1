
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn-2.webcatalog.io/switchbar/Switchbar%20Setup%2016.9.1.exe'
$url64      = 'https://cdn-2.webcatalog.io/switchbar/Switchbar%20Setup%2016.9.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'switchbar*'

  checksum      = 'E96EDDA9D2679E74E849A06B26BC11C48FCA1B4E568B775AACECF846EEC94405'
  checksumType  = 'sha256'
  checksum64    = 'E96EDDA9D2679E74E849A06B26BC11C48FCA1B4E568B775AACECF846EEC94405'
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

# prevents warning pop-up if process already exists
Stop-Process -Name Switchbar -ErrorAction SilentlyContinue
Install-ChocolateyPackage @packageArgs