# bouton voir les logs
$BoutonVoirLesLogs = New-Object System.Windows.Forms.Button
$BoutonVoirLesLogs.Text = "VOIR LES LOGS"
$BoutonVoirLesLogs.Location = [System.Drawing.Point]::new(($form.Width - $BoutonVoirLesLogs.Width) / 20, $buttonOpenScriptDirectory.Bottom + 5)
 

 
# mise en forme normales
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $BoutonVoirLesLogs.$($_.Key) = $_.Value
}

# mise en forme pour le survol de la souris
$BoutonVoirLesLogs.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $BoutonVoirLesLogs.$($_.Key) = $_.Value
    }
})

# mise en forme  pour quand la souris quitte le bouton
$BoutonVoirLesLogs.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $BoutonVoirLesLogs.$($_.Key) = $_.Value
    }
})
	

$BoutonVoirLesLogs.Add_Click({
# Chemin du fichier CSV
$cheminFichierCSV = "a:\config\Variables\Tableur\${env:USERNAME}_${env:COMPUTERNAME}.csv"

# Chemin du script TableurParDefault.ps1
$cheminScriptTableur = "a:\config\TableurParDefault.ps1"

# Vérifier si le fichier CSV existe
if (Test-Path $cheminFichierCSV) {
    Write-Host "Le fichier CSV existe. Continuer avec le script TableurParDefault.ps1."
    # Ajoutez ici le code pour continuer avec le script TableurParDefault.ps1
} else {
    Write-Host "Le fichier CSV n'existe pas. Lancer le script TableurParDefault.ps1."
    # Ajoutez ici le code pour lancer le script TableurParDefault.ps1
    Invoke-Expression -Command $cheminScriptTableur
}


       # Lance le script qui fait une copie de consoltation des logs 
      Start-Process powershell.exe -ArgumentList "-NoExit", "-ExecutionPolicy Bypass", "-File a:\config\LogsVoir.ps1"


})
$form.Controls.Add($BoutonVoirLesLogs)
