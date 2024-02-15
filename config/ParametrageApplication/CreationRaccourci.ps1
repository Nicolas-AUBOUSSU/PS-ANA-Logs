################################
#                              #
#    création du raccourci     #
#                              #
################################




# Récupérer le nom de l'application
$NomApplication = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\NomApplication.txt"

# Chemin du dossier à vérifier
$cheminDossier = "C:\Temp\"

# Vérifier si le dossier existe
if (-not (Test-Path $cheminDossier)) {
    # Créer le dossier s'il n'existe pas
    New-Item -ItemType Directory -Path $cheminDossier
    Write-Host "Le dossier a été créé avec succès."
} else {
    Write-Host "Le dossier existe déjà."
}

# Copier le fichier avec le nouveau nom
Copy-Item -Path "A:\PS_ANA-Logs\config\img\raccourci.ico" -Destination "A:\PS_ANA-Logs\config\Variables\Raccourci\$NomApplication.ico" -Force
Copy-Item -Path "A:\PS_ANA-Logs\config\img\raccourci.ico" -Destination "C:\Temp\$NomApplication.ico" -Force

# Pause d'une seconde
Start-Sleep -Seconds 1


# Chemin du fichier _lanceur.bat
$CheminLanceur = "A:\PS_ANA-Logs\_lanceur.bat"

# Répertoire de destination pour le raccourci
$RepertoireDestination = "A:\PS_ANA-Logs\config\Variables\Raccourci\"
 

# Spécifier le chemin de l'icône
$CheminIcone = "C:\Temp\$NomApplication.ico"

# Créer un objet raccourci
$objetRaccourci = New-Object -ComObject WScript.Shell
$raccourci = $objetRaccourci.CreateShortcut("$RepertoireDestination\$($NomApplication).lnk")

# Spécifier le chemin de la cible
$raccourci.TargetPath = $CheminLanceur



# Spécifier le chemin de l'icône pour le raccourci
$raccourci.IconLocation = "$CheminIcone,0" # Ajout de ",0" pour spécifier l'index de l'icône dans le fichier ICO

# Enregistrer le raccourci avec l'icône mise à jour
$raccourci.Save()

Write-Host "Le raccourci a été créé avec succès dans $RepertoireDestination avec l'icône mise à jour depuis $CheminIcone."
