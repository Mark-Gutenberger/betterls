#! /bin/pwsh

Write-Host "`nruning from:`n  $(Get-Location)/`n"
Write-Host "make sure you run from the root of the project." -ForegroundColor Yellow
Write-Host "comment out these lines in" -ForegroundColor Yellow -NoNewline
Write-Host " ``./scripts/install-deps.ps1`` " -NoNewline
Write-Host "to silence this warning`n" -ForegroundColor Yellow

Write-Host "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Cyan
Write-Host "INFO: installing dirent-1.23.2...`n" -ForegroundColor Blue
.\vcpkg\vcpkg install dirent

Write-Host "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Cyan
Write-Host "INFO: installing rapidyaml...`n" -ForegroundColor Blue
.\vcpkg\vcpkg install ryml

Write-Host "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Cyan
Write-Host "INFO: installing termcolor-2.0.0...`n" -ForegroundColor Blue
.\vcpkg\vcpkg install termcolor

Write-Host "Sucess!`n" -ForegroundColor Green
exit 0
