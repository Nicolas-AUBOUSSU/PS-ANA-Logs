# Création du bouton "Actualiser"
$buttonRefresh = New-Object System.Windows.Forms.Button
$buttonRefresh.Text = "ACTUALISER"
$buttonRefresh.Location = [System.Drawing.Point]::new(($form.Width - $buttonRefresh.Width) / 20, $menu.Bottom + 5)



 
# mise en forme normales
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $buttonRefresh.$($_.Key) = $_.Value
}

# mise en forme pour le survol de la souris
$buttonRefresh.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $buttonRefresh.$($_.Key) = $_.Value
    }
})

# mise en forme  pour quand la souris quitte le bouton
$buttonRefresh.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $buttonRefresh.$($_.Key) = $_.Value
    }
})


$buttonRefresh.Add_Click({
    
	
	# script pour actualiser la ListBox
	a:\config\ActualiserListBox.ps1
	
	
	

    # variable utilisé dans LogsFichierXLSX.ps1
    $action = "ACTUALISER LA ListBox"
    $scriptName = "$NomApplication" 
	
    # Script pour l'ajout dans le fichier de logs 
    & "a:\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName 


})


$form.Controls.Add($buttonRefresh)
