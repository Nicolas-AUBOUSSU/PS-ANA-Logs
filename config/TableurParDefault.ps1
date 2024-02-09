# Chemin de base pour le répertoire le fichier CSV sera enregistré
$variablesDir = "a:\config\Variables\Tableur"

# Vérifie si le répertoire existe, sinon le créer
if (-not (Test-Path -Path $variablesDir)) {
    New-Item -ItemType Directory -Path $variablesDir
}

# Fonction pour ouvrir une boite de dialogue permettant de sélectionner un fichier
function Select-Executable {
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Filter = "Executables (*.exe)|*.exe"
    $dialog.Title = "Sélectionner le tableur par défaut"
    $result = $dialog.ShowDialog()

    if ($result -eq "OK") {
        return $dialog.FileName
    } else {
        return $null
    }
}

# Créer l'interface utilisateur
Add-Type -AssemblyName System.Windows.Forms
$form = New-Object Windows.Forms.Form
$form.Text = "Configuration du Tableur"
$form.Size = New-Object Drawing.Size @(400, 150)
$form.StartPosition = "CenterScreen"

# Bouton pour sélectionner le tableur par défaut
$btnSelectTableur = New-Object Windows.Forms.Button
$btnSelectTableur.Location = New-Object Drawing.Point @(50, 50)
$btnSelectTableur.Size = New-Object Drawing.Size @(150, 50)
$btnSelectTableur.Text = "Sélectionner le Tableur par Défaut"
$btnSelectTableur.Add_Click({
    $PathTableur = Select-Executable
    if ($PathTableur) {
        # Enregistrez le chemin dans le fichier CSV
        $username = $env:USERNAME
        $hostname = $env:COMPUTERNAME
        $csvFileName = "$variablesDir\${username}_${hostname}.csv"
        $PathTableur | Out-File -FilePath $csvFileName -Encoding UTF8


        # Fermez la forme aprés avoir cliqué sur le bouton
        $form.Close()
    }
})
$form.Controls.Add($btnSelectTableur)

#  label pour le texte  
$labelTexteSupplementaire = New-Object Windows.Forms.Label
$labelTexteSupplementaire.Location = New-Object Drawing.Point @(50, 10)
$labelTexteSupplementaire.Size = New-Object Drawing.Size @(320, 30)
$labelTexteSupplementaire.Text = "Choisir le tableur que vous voulez utiliser, Libre Office Calc portable et inclut dans l'application."
$form.Controls.Add($labelTexteSupplementaire)

# Bouton pour exécuter le code fourni avec le tableur par défaut
$btnRunCode = New-Object Windows.Forms.Button
$btnRunCode.Location = New-Object Drawing.Point @(220, 50)
$btnRunCode.Size = New-Object Drawing.Size @(150, 50)
$btnRunCode.Text = "Laisser Libre Office Calc Portable par Défaut"
$btnRunCode.Add_Click({
    # Utilisation du chemin spécifique pour LibreOfficeCalcPortable.exe
    $PathTableur = "a:\LibreOfficePortable\LibreOfficeCalcPortable.exe"

    # Enregistrez également le chemin dans le fichier CSV
    $username = $env:USERNAME
    $hostname = $env:COMPUTERNAME
    $csvFileName = "$variablesDir\${username}_${hostname}.csv"
    $PathTableur | Out-File -FilePath $csvFileName -Encoding UTF8

    # variable utilisée dans LogsFichierXLSX.ps1
    $action = "CHANGER DE TABLEUR PAR DEFAULT"
    $scriptName = "$NomApplication"
    $CheminDesLogs = "$PathTableur"

    # Script pour l'ajout dans le fichier de logs
    & "a:\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName -CheminDesLogs $CheminDesLogs

    # Fermez la forme aprés avoir cliqué sur le bouton
    $form.Close()
})
$form.Controls.Add($btnRunCode)

# Afficher la forme
$form.ShowDialog()

& "a:\config\FormMessageTermine.ps1"
