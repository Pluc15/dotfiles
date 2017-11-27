#Requires -RunAsAdministrator

$env:Dotfiles = (Get-Item -Path ".\" -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

# Choco
Set-ExecutionPolicy AllSigned; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install `
fzf `
git `
git.install `
gitextensions `
paint.net `
greenshot `
nodejs-lts `
dotnetcore-sdk `
poshgit