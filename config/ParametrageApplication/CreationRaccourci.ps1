################################
#                              #
#    crÃ©ation du racourcie     #
#                              #
################################

# Chemins vers les fichiers de configuration
$cheminLecteur = "a:\config\Variables\CheminDeBase.ps1"
$cheminNomApplication = "a:\config\Variables\NomApplication.txt"

# rÃ©cupÃ©ration des valeurs du chemin et du nom de l'application
$lecteur = Get-Content $cheminLecteur -ErrorAction Stop
Write-Host "Lecteur: $lecteur"
$nomApplication = Get-Content $cheminNomApplication -ErrorAction Stop
Write-Host "Nom de l'application: $nomApplication"

# verification de l'existence du rÃ©pertoire 
if (-not (Test-Path $dossierTemp)) {
    New-Item -Path $dossierTemp -ItemType Directory
    Write-Host "Dossier C:\temp crÃ©Ã©."
}

# copie de l'icÃ´ne dans le dossier local pour Ã©viter les problÃ¨mes d'affichage
$cheminIconeOriginal = $lecteur + "\config\img\raccourci.ico"
$cheminIconeTemp = Join-Path -Path $dossierTemp -ChildPath "raccourci.ico"
Copy-Item -Path $cheminIconeOriginal -Destination $cheminIconeTemp -Force
Write-Host "IcÃ´ne copiÃ©e vers C:\temp"

# vÃ©rification de l'existence du fichier d'icÃ´ne
if (Test-Path $cheminIconeTemp) {
    Write-Host "Le fichier d'icÃ´ne existe."
} else {
    Write-Host "Le fichier d'icÃ´ne n'existe pas!"
    exit
}

# crÃ©ation du raccourci
$cheminLanceur = "_Lanceur.bat"
$bureau = [Environment]::GetFolderPath("Desktop")
Write-Host "Bureau de l'utilisateur: $bureau"

$cheminRaccourci = Join-Path -Path $bureau -ChildPath "$nomApplication.lnk"
Write-Host "Chemin du raccourci: $cheminRaccourci"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($cheminRaccourci)
$Shortcut.TargetPath = Join-Path -Path $lecteur -ChildPath $cheminLanceur
Write-Host "Chemin cible du raccourci: $($Shortcut.TargetPath)"
$Shortcut.IconLocation = $cheminIcone
Write-Host "Emplacement de l'icÃ´ne du raccourci: $($Shortcut.IconLocation)"
$Shortcut.Save()
Write-Host "Raccourci enregistrÃ©."
