# bouton pour fermer la fenétre et PowerShell ISE
$BoutonTableurParDefault = New-Object System.Windows.Forms.Button
$BoutonTableurParDefault.Text = "CHANGER LE TABLEUR"
$BoutonTableurParDefault.Location = [System.Drawing.Point]::new(($form.Width - $BoutonTableurParDefault.Width) / 20, $BoutonEditeurCodeDefault.Bottom + 5)


 
# mise en forme normales
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $BoutonTableurParDefault.$($_.Key) = $_.Value
}

# mise en forme pour le survol de la souris
$BoutonTableurParDefault.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $BoutonTableurParDefault.$($_.Key) = $_.Value
    }
})

# mise en forme  pour quand la souris quitte le bouton
$BoutonTableurParDefault.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $BoutonTableurParDefault.$($_.Key) = $_.Value
    }
})

 
$BoutonTableurParDefault.Add_Click({
	        
# Bouton de fermeture avec création des logs
. "a:\config\TableurParDefault.ps1"

})


$form.Controls.Add($BoutonTableurParDefault)
