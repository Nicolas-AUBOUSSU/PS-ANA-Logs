##########################################
#                                        #
#        Création de _lanceur.bat        #
#                                        #
##########################################

$lecteur = "A:\PS_ANA-Logs"
$Chemin_form = "A:\PS_ANA-Logs\config\_form.ps1"

Write-Host $Chemin_form

$batContent = @"
@echo off
powershell.exe -WindowStyle Hidden -File "$Chemin_form" 
"@

$batFilePath = Join-Path $lecteur "_lanceur.bat"
$batContent | Out-File -FilePath $batFilePath -Encoding Default

Write-Host "Le fichier _lanceur.bat a été créé avec succès."
