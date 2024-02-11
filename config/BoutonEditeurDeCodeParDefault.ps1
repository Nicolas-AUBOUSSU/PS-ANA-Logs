# bouton pour changer l'éditeur de code par défaut
$BoutonEditeurCodeDefault = New-Object System.Windows.Forms.Button
$BoutonEditeurCodeDefault.Text = "CHANGER D'EDITEUR DE CODE"
$BoutonEditeurCodeDefault.Location = [System.Drawing.Point]::new(($form.Width - $BoutonEditeurCodeDefault.Width) / 20, $boutonCreationScript.Bottom + 5)


 
# mise en forme normales
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $BoutonEditeurCodeDefault.$($_.Key) = $_.Value
}

# mise en forme pour le survol de la souris
$BoutonEditeurCodeDefault.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $BoutonEditeurCodeDefault.$($_.Key) = $_.Value
    }
})

# mise en forme  pour quand la souris quitte le bouton
$BoutonEditeurCodeDefault.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $BoutonEditeurCodeDefault.$($_.Key) = $_.Value
    }
})

 
$BoutonEditeurCodeDefault.Add_Click({
	        
# Bouton de fermeture avec création des logs
. "A:\PS_ANA-Logs\config\EditeurDeCodeParDefaultSelection.ps1"

})


$form.Controls.Add($BoutonEditeurCodeDefault)
