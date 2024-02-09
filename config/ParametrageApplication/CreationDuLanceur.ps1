##########################################
#                                        #
#        CrÃ©ation de _lanceur.bat        #
#                                        #
##########################################

$lecteur = "a:"
$Chemin_form = "a:\config\_form.ps1"

Write-Host $Chemin_form

$batContent = @"
@echo off
PowerShell.exe -ExecutionPolicy Bypass -File "$Chemin_form"
"@

$batFilePath = Join-Path $lecteur "_lanceur.bat"
$batContent | Out-File -FilePath $batFilePath -Encoding UTF8

Write-Host "Le fichier _lanceur.bat a Ã©tÃ© crÃ©Ã© avec succÃ¨s."
