# bouton "EDITER LE CODE"
$BoutonEditeurDeCode = New-Object System.Windows.Forms.Button
$BoutonEditeurDeCode.Text = "EDITER LE CODE"
$BoutonEditeurDeCode.Location = [System.Drawing.Point]::new(($form.Width - $BoutonEditeurDeCode.Width - 90), $searchBox.Bottom + 5)

 
# mise en forme normales
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $BoutonEditeurDeCode.$($_.Key) = $_.Value
}

# Modification des valeurs par défaut du bouton après avoir appliqué les styles de $Bouton_1_Variables
$BoutonEditeurDeCode.Width = 115

# mise en forme pour le survol de la souris
$BoutonEditeurDeCode.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $BoutonEditeurDeCode.$($_.Key) = $_.Value
    }
# Modification des valeurs par défaut du bouton après avoir appliqué les styles de $Bouton_1_Variables
$BoutonEditeurDeCode.Width = 115
})

# mise en forme  pour quand la souris quitte le bouton
$BoutonEditeurDeCode.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $BoutonEditeurDeCode.$($_.Key) = $_.Value
    }
   # Modification des valeurs par défaut du bouton après avoir appliqué les styles de $Bouton_1_Variables
$BoutonEditeurDeCode.Width = 115
})


$BoutonEditeurDeCode.Add_Click({
	
   # variable repertoire des scripts	
   $scriptDirectory = "a:\script"
  # script pour récuperer l'application qui va éditer le code $EditeurDeCode
. "a:\config\EditeurDeCodeParDefaultApplique.ps1"
   
   # affiche un message si l'on a pas selectionné de script
   # si pas selectionné dans la ListBox
    if (-not $menu.SelectedItem) {
		# message 
        [System.Windows.Forms.MessageBox]::Show("Veuillez sélectionner un script avant de continuer.", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
   

   } else {
	   # nom du script selectionné
        $selectedScript = $menu.SelectedItem.ToString()
       
	   # création du chemin du script selectionné
        $scriptPath = Join-Path -Path $scriptDirectory -ChildPath $selectedScript 
        
        # ouvre le script avec l'éditeur de code par default
        Start-Process -FilePath $EditeurDeCode -ArgumentList "`"$scriptPath`""





        # Exécuter LogsScriptHistory.ps1 
        a:\config\LogsScriptHistory.ps1 $scriptPath 

    }
})

$form.Controls.Add($BoutonEditeurDeCode)


