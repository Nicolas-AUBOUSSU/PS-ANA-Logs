# Bouton pour ouvrir le répertoire des scripts
$buttonOpenScriptDirectory = New-Object System.Windows.Forms.Button
$buttonOpenScriptDirectory.Text = "OUVRIR LE RÉPERTOIRE DES SCRIPTS"
$buttonOpenScriptDirectory.Location = [System.Drawing.Point]::new(($form.Width - $buttonOpenScriptDirectory.Width) / 20, $buttonRefresh.Bottom + 5)

# Mise en forme normale
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $buttonOpenScriptDirectory.$($_.Key) = $_.Value
}

# Mise en forme pour le survol de la souris
$buttonOpenScriptDirectory.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $buttonOpenScriptDirectory.$($_.Key) = $_.Value
    }
})

# Mise en forme pour quand la souris quitte le bouton
$buttonOpenScriptDirectory.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $buttonOpenScriptDirectory.$($_.Key) = $_.Value
    }
})

$buttonOpenScriptDirectory.Add_Click({
    # Ouvrir le répertoire des scripts
    Invoke-Item -Path $scriptPath
    
    # Variables utilisées dans LogsFichierXLSX.ps1
    $action = "OUVERTURE DU RÉPERTOIRE DES SCRIPTS"
    $scriptName = "$NomApplication"  
    # Script pour l'ajout dans le fichier de logs 
    & "A:\PS_ANA-Logs\config\LogsFichierXLSX.ps1" -Action $action -Script $scriptName 
})

# Ajout du bouton au formulaire
$form.Controls.Add($buttonOpenScriptDirectory)
