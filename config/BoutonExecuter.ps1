# Définir l'encodage UTF-8-BOM pour le script
$Utf8BomEncoding = New-Object System.Text.UTF8Encoding $true

# Créer le bouton pour Exécuter le script
$BoutonExecute = New-Object System.Windows.Forms.Button
$BoutonExecute.Text = "EXECUTER"
$BoutonExecute.Location = [System.Drawing.Point]::new(($form.Width - $BoutonExecute.Width) / 2 - 80, $searchBox.Bottom + 5)

# Mise en forme normale du bouton
$Bouton_1_Variables.GetEnumerator() | ForEach-Object {
    $BoutonExecute.$($_.Key) = $_.Value
}

# Modification des valeurs par défaut du bouton après avoir appliqué les styles de $Bouton_1_Variables
$BoutonExecute.Width = 80
$BoutonExecute.BackColor = [System.Drawing.Color]::Red

# Mise en forme pour le survol de la souris
$BoutonExecute.Add_MouseEnter({
    $Bouton_1_survole_Variables.GetEnumerator() | ForEach-Object {
        $BoutonExecute.$($_.Key) = $_.Value
    }
    # Modification des valeurs par défaut du bouton après avoir appliqué les styles de $Bouton_1_Variables
    $BoutonExecute.Width = 80
})

# Mise en forme pour quand la souris quitte le bouton
$BoutonExecute.Add_MouseLeave({
    $Bouton_1_Variables.GetEnumerator() | ForEach-Object {
        $BoutonExecute.$($_.Key) = $_.Value
    }
    # Réappliquer les modifications spécifiques après l'événement MouseLeave
    $BoutonExecute.Width = 80
    $BoutonExecute.BackColor = [System.Drawing.Color]::Red
})

# Ajouter le gestionnaire d'événement Click pour le bouton Execute
$BoutonExecute.Add_Click({
    if (-not $menu.SelectedItem) {
        # Indique qu'il faut sélectionner un script
        [System.Windows.Forms.MessageBox]::Show("Veuillez sélectionner un script avant de continuer.", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    } else {
        # Chemin du fichier CSV
        $cheminFichier = "a:\config\Variables\Script_a_Lancer\$($env:COMPUTERNAME)_$($env:USERNAME).csv"

        # Créer un objet CSV s'il n'existe pas
        if (-not (Test-Path $cheminFichier)) {
            $header = "ComputerName", "UserName", "SelectedItem"
            $header -join "," | Out-File -FilePath $cheminFichier -Encoding UTF8
        }

        # Obtenir la valeur de $menu.SelectedItem
        $selectedItem = $menu.SelectedItem

        # Créer une nouvelle ligne CSV avec les informations actuelles
        $nouvelleLigne = "a:\Script\$selectedItem"

        # Écrire ou remplacer la ligne dans le fichier CSV
        $nouvelleLigne | Out-File -FilePath $cheminFichier -Encoding UTF8
        Write-Host $nouvelleLigne $cheminFichier

        # Créer une boîte de dialogue pour demander l'élévation des privilèges
        $confirmation = [System.Windows.Forms.MessageBox]::Show("Voulez-vous exécuter le script en tant qu'administrateur ?", "Confirmation", [System.Windows.Forms.MessageBoxButtons]::YesNoCancel, [System.Windows.Forms.MessageBoxIcon]::Question)

        if ($confirmation -eq [System.Windows.Forms.DialogResult]::Yes) {
            # Appeler le script en tant qu'administrateur
            Start-Process powershell.exe -ArgumentList "-NoExit", "-ExecutionPolicy Bypass", "-File a:\config\LogsScriptDeCaptureFenetrePowershell.ps1"   -Verb RunAs
        } elseif ($confirmation -eq [System.Windows.Forms.DialogResult]::No) {
            # Appeler le script normalement
            Start-Process powershell.exe -ArgumentList "-NoExit", "-ExecutionPolicy Bypass", "-File a:\config\LogsScriptDeCaptureFenetrePowershell.ps1", "-selectedScript $($menu.SelectedItem)" 
        } else {
            # L'utilisateur a annulé l'opération
            Write-Host "Opération annulée par l'utilisateur."
        }

        Write-Host "$($menu.SelectedItem)"
    }
})

# Ajouter le bouton Execute au formulaire
$form.Controls.Add($BoutonExecute)
