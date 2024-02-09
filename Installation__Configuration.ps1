##############################################################
#    Vérrification si la configuration a déja était faite    #
##############################################################

$NomFichierLanceur = "_lanceur.bat"

# Vérifier l'existence du fichier _lanceur dans le répertoire courant
if (Test-Path $NomFichierLanceur) {
    # Le fichier existe, demander confirmation pour continuer
    $Reponse = Read-Host "L'installation a déjà été effectuée.`nSi vous changez la configuration, il se peut que le logiciel ne fonctionne plus.`nVoulez-vous continuer ? (O/N)"
    
    if ($Reponse.ToLower() -eq "o") {
        Write-Host "Lancement de l'installation..."
    } else {
        Write-Host "La nouvelle installation a été annulée."
        exit
    }
} else {
    # Le fichier n'existe pas, lancer le script directement
    Write-Host "Lancement de l'installation..."
}

######################################################
#    choix et modification du chemin du logiciel     #
######################################################

# fichier qui contient le chemin du logiciel
$path = Split-Path -Parent $MyInvocation.MyCommand.Definition
$valeurARemplacerPath = Join-Path -Path $path -ChildPath "config\Variables\CheminDeBase.ps1"
$valeurARemplacer = Get-Content -Path $valeurARemplacerPath -First 1

# Demander le nouveau chemin
Write-Host "Pour une utilisation multiposte, il faut un chemin SMB"
Write-Host "Example : \\serveur\partage"
Write-Host "Pour une utilisation nonoposte il faut le chemin local"
Write-Host "Example : C:\PS-ANA-Logs  (attention il faut minimun la lettre du lecteur et les deux points :)"
do {
    $nouvelleValeur = Read-Host "Entrez le chemin "

    if (Test-Path $nouvelleValeur) {
        Write-Host "Le chemin est valide."
        $cheminValide = $true
    } else {
        Write-Host "Le chemin n'est pas valide. Veuillez réessayer."
        $cheminValide = $false
    }
} while (-not $cheminValide)


# Remplacer la valeur dans les scripts
Get-ChildItem -Path ".\config" -Filter "*.ps1" -Recurse | ForEach-Object {
    Write-Host "Traitement du fichier : $($_.FullName)"
    $contenu = Get-Content -Path $_.FullName
    $nouveauContenu = $contenu -replace [regex]::Escape($valeurARemplacer), $nouvelleValeur
    $nouveauContenu | Set-Content -Path $_.FullName -Encoding UTF8
    Write-Host "Remplacement effectué avec succès."
}

Write-Host "Tous les fichiers ont été traités avec succès."

################################
#    nom de l'application      #
################################

. "\\Pcp_na_lenovo\a$\config\ParametrageApplication\NomApplication.ps1"n

################################
#    création de l'icone       #
################################

. "\\Pcp_na_lenovo\a$\config\ParametrageApplication\CreationIcone.ps1" 


################################
#    création du racourcie     #
################################

. "\\Pcp_na_lenovo\a$\config\ParametrageApplication\CreationRaccourci.ps1"

##########################################
#    changement du logo dans l'appli     #
##########################################

. "\\Pcp_na_lenovo\a$\config\ParametrageApplication\ChangementLogoDansLapplication.ps1"

##########################################
#           Choix des couleurs           #
##########################################

write-host "Dans la boîte de dialogue, sélectionnez une couleur pour chaque élément."

. "\\Pcp_na_lenovo\a$\config\ParametrageApplication\ModificationDesCouleurs.ps1"

##########################################
#        Création de _lanceur.bat        #
##########################################

. "\\Pcp_na_lenovo\a$\config\ParametrageApplication\CreationDuLanceur.ps1"

####################
#        FIN       #
####################

Write-Host "Installation terminée."
