# Récupérer le nom de l'application
$NomApplication = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\NomApplication.txt"




# Chemin du fichier
$FichierTestMAJ = "A:\PS_ANA-Logs\config\Variables\MAJraccourci.txt"

# Demander le nom du fichier à inscrire
$ContenuFichierTestMAJ = Read-Host "Entrez le nom du fichier qui sera utiliser pour la vérification de la mise à jour par le script GPO_$NomApplication.ps1"

# Remplacer le contenu du fichier
$ContenuFichierTestMAJ | Set-Content -Path $FichierTestMAJ

Write-Host "Le fichier $FichierTestMAJ a été mis à jour avec succès. Le nouveau contenu est : $ContenuFichierTestMAJ"




# Enregistrer les lignes dans un fichier
$Code = @'


$MAJraccourci = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\MAJraccourci.txt"
$FichierTestMAJ = "C:\Temp\$MAJraccourci"

Write-Host "MAJraccourci: $FichierTestMAJ"

if (-not (Test-Path $FichierTestMAJ))  {
    # Récupérer le nom de l'application
    $NomApplication = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\NomApplication.txt"

    # Copier l'icône vers le dossier Temp
    Copy-Item -Path "A:\PS_ANA-Logs\config\Variables\Raccourci\$NomApplication.ico" -Destination "C:\Temp\$NomApplication.ico" -Force

    # Copier le raccourci vers le bureau de l'utilisateur actuel
    Copy-Item -Path "A:\PS_ANA-Logs\config\Variables\Raccourci\$NomApplication.lnk" -Destination "$($env:USERPROFILE)\Desktop\$NomApplication.lnk" -Force

    # Créer un fichier de vérification de la mise à jour
    New-Item -Path $FichierTestMAJ -ItemType File
}

'@

# Enregistrer le code dans un fichier
$Code | Out-File -FilePath "A:\PS_ANA-Logs\GPO_$NomApplication.ps1" -Encoding Unicode -Force 


