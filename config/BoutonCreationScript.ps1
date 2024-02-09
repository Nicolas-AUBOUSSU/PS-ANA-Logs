# Bouton pour créer le script
$boutonCreationScript = New-Object System.Windows.Forms.Button
$boutonCreationScript.Text = "CREATION SCRIPT"
$boutonCreationScript.Location = [System.Drawing.Point]::new(($form.Width - $boutonCreationScript.Width) / 20, $BoutonVoirLesLogs.Bottom + 5)

 
# mise en forme normales
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $boutonCreationScript.$($_.Key) = $_.Value
}

# mise en forme pour le survol de la souris
$boutonCreationScript.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $boutonCreationScript.$($_.Key) = $_.Value
    }
})

# mise en forme  pour quand la souris quitte le bouton
$boutonCreationScript.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $boutonCreationScript.$($_.Key) = $_.Value
    }
})


$boutonCreationScript.Add_Click({
    
    & "a:\config\CreationScript.ps1"
})


$form.Controls.Add($boutonCreationScript)
