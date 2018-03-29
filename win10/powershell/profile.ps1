# Register custom scripts and modules
Import-Module "$env:Dotfiles\win10\powershell\scripts\git-functions.psm1"
Import-Module "$env:Dotfiles\win10\powershell\scripts\fuzzy-history.psm1"
Set-Alias -Name "lpass" -Value "$env:Dotfiles\win10\powershell\scripts\lpass.ps1"

# Hotkeys
#Set-PSReadlineKeyHandler -Chord Ctrl+R -Function Get-FuzzyHistory
Set-PSReadlineKeyHandler -Key Ctrl+R `
	-BriefDescription "FuzzyHistory" `
	-LongDescription "FuzzyHistory" `
	-ScriptBlock {
	param($key, $arg)

	Get-FuzzyHistory
}

# Z
Import-Module z
Set-Alias z Search-NavigationHistory

# Prompt
Function Prompt () {
	If (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
		Write-Host "[Admin] " -NoNewLine -ForegroundColor "Red"
	}
	Write-Host $env:COMPUTERNAME -NoNewLine -ForegroundColor "White"
	Write-Host ":" -NoNewLine
	Write-Host $pwd.ProviderPath -ForegroundColor "Green"
	Write-Host ">" -NoNewLine -ForegroundColor "DarkGray"
	return " "
}

# Default folder
$CurrentLocation = Get-Location
if ($CurrentLocation.Path -eq "$env:HOMEDRIVE$env:HOMEPATH") {
	Set-Location $env:PSHOME
}