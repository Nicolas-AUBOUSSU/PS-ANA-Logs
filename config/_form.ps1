$NomApplication = Get-Content -Path "a:\config\Variables\NomApplication.txt"

Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms

# Activer les styles visuels pour les contrôles
[System.Windows.Forms.Application]::EnableVisualStyles()

 


$form = New-Object System.Windows.Forms.Form
$form.Text = $NomApplication
$form.Size = New-Object System.Drawing.Size(300, 780)
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual
$form.Location = New-Object System.Drawing.Point(0, 0)
$form.Font = New-Object System.Drawing.Font("Calibri", 10) 
 #Variable des couleurs et mise en forme
 . "a:\config\Variables\MiseEnForme.ps1"

# Varriable du répertoire des scripts
$scriptPath = "a:\script"




    #varriable utilisé dans LogsFichierXLSX.ps1 pour l'ouverture
     $action = "OUVERTURE DE $NomApplication"
     $scriptName = $NomApplication
	$CheminDesLogs = ""
	 
	 
# Script pour l'ajout dans le fichier de logs bien mettre les varriables 
a:\config\LogsFichierXLSX.ps1 -action $action, -Script $scriptName, -'CheminDesLogs' $CheminDesLogs


#Logo
. "a:\config\logo.ps1"

#Barre de recherche
. "a:\config\BarreDeRecherche.ps1"

# Bouton pour Executer le script avec création des logs
. "a:\config\BoutonExecuter.ps1"

# Bouton pour Ouvrir le script dans éditeur de code avec une sauvegarde .\ScriptHistory avec création des logs
. "a:\config\BoutonEditerLeCode.ps1"

# ListBox qui contient les scripts du répertoire .\script
. "a:\config\ListBoxScript.ps1"

# Actualise a l'ouverture la ListBox avec création des logs
. "a:\config\ActualiserListBox.ps1"

# Bouton pour actualiser la ListBox des scripts avec création des logs
. "a:\config\BoutonActualiser.ps1"

# Ouvre le répertoire des scripts avec création des logs
. "a:\config\BoutonOuvrirRepertoireScript.ps1"

# Ouvre une copie du fichier de log sauvegardé .\ConsultationLogs avec création des logs
. "a:\config\BoutonVoirLesLogs.ps1"

# Bouton de création de script
. "a:\config\BoutonCreationScript.ps1"

# Bouton changer d'éditeur de code
. "a:\config\BoutonEditeurDeCodeParDefault.ps1"

# Bouton changer de tableur
. "a:\config\BoutonTableurParDefault.ps1"


# Bouton fermer de la femétre appel le script LogsFichierXLSX.ps1
$form.Add_FormClosing({
    # Variables utilisées dans LogsFichierXLSX.ps1 pour la fermeture (utilise aussi ceux de l'ouverture au début)
    $action = "FERMETURE DE $NomApplication"
    $scriptName = $NomApplication

    # Script pour l'ajout dans le fichier de logs
    a:\config\LogsFichierXLSX.ps1 -action $action -Script $scriptName -CheminDesLogs $CheminDesLogs
})

# Afficher la fenétre
$form.ShowDialog()
