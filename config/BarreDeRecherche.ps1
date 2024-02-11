# Titre "Rechercher"
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "Rechercher :"
# Variable des couleurs
. "A:\PS_ANA-Logs\config\Variables\MiseEnForme.ps1"
$labelTitle.Font = New-Object System.Drawing.Font("Calibri", 17)
$labelTitle.AutoSize = $true  # Permet au label de s'ajuster automatiquement à la largeur du texte

# Fixer la position horizontale et verticale
$labelTitle.Anchor = [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right

$labelTitle.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$labelTitle.Location = [System.Drawing.Point]::new(0, 85)
$form.Controls.Add($labelTitle)

# Cellule de recherche (TextBox)
$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.MinimumSize = New-Object System.Drawing.Size(280, 0)  # Largeur minimale de 280
$searchBox.Location = [System.Drawing.Point]::new(($form.Width - 280) / 5, $labelTitle.Bottom + 10)
$searchBox.Font = New-Object System.Drawing.Font("Calibri", 12)
$form.Controls.Add($searchBox)

# Ajouter l'événement de redimensionnement
$form.add_Resize({
    $searchBox.Width = [math]::round($form.Width * 0.9)  # 90% de la largeur de la forme
})


# Gestionnaire d'événement pour le changement de texte dans la TextBox
$searchBox.add_TextChanged({
    $filter = $searchBox.Text.ToLower()
    $menu.Items.Clear()
    
    $scripts | ForEach-Object {
        if ($_.Name.ToLower().Contains($filter)) {
            $menu.Items.Add($_.Name)
        }
    }
})

 
