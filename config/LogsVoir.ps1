# Définir le chemin du fichier CSV en utilisant les variables d'environnement
$cheminFichierPathTableur = "a:\config\Variables\Tableur\${env:USERNAME}_${env:COMPUTERNAME}.csv"

# Chemin du tableur par défaut
$cheminTableurParDefault = Get-Content $cheminFichierPathTableur -ErrorAction SilentlyContinue


# Chemin du fichier log source
$cheminFichierLog = "a:\log\logs.xlsx"

# Répertoire de destination
$destination = "a:\log\ConsultationLogs"

# Obtenir la date et l'heure actuelles
$dateHeure = Get-Date -Format "yyyy-MM-dd__HH-mm-ss"

# Obtenir le nom d'utilisateur
$username = $env:USERNAME

# Construire le nom du fichier
$FichierDeConsultationDeLog = "Consultation_${dateHeure}_${username}_log.xlsx"

# Chemin complet de destination
$cheminDestinationConsultationLog = Join-Path -Path $destination -ChildPath $FichierDeConsultationDeLog

# Copier le fichier vers la destination et le renommer
Copy-Item -Path $cheminFichierLog -Destination $cheminDestinationConsultationLog

# Ouvrir le fichier Excel en arrière-plan
Start-Process -FilePath $cheminTableurParDefault -ArgumentList "$cheminDestinationConsultationLog"

# Variable utilisée dans LogsFichierXLSX.ps1
$action = "CONSULTATION DES LOGS"
$scriptName = $MyInvocation.MyCommand.Name

# Utilisation directe du chemin complet
$CheminDesLogs = $cheminDestinationConsultationLog

# Script pour l'ajout dans le fichier de logs
& "a:\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName -CheminDesLogs $CheminDesLogs

# Fermeture 
$host.SetShouldExit(0)
