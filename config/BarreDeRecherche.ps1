

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

 
