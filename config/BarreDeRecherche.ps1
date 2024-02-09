# Titre "Rechercher"
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "Rechercher"
# Variable des couleurs
. "a:\config\Variables\color\colors.ps1"
$labelTitle.Font = New-Object System.Drawing.Font("Calibri", 15)
$labelTitle.AutoSize = $true  # Permet au label de s'ajuster automatiquement à la largeur du texte

# Fixer la position horizontale et verticale
$labelTitle.Anchor = [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right

$labelTitle.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$labelTitle.Location = [System.Drawing.Point]::new(0, 85)
$form.Controls.Add($labelTitle)

# Cellule de recherche (TextBox)
$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.MinimumSize = New-Object System.Drawing.Size(260, 0)  # Largeur minimale de 260
$searchBox.Width = [math]::round($form.Width * $searchBoxWidthPercentage)
$searchBox.Location = [System.Drawing.Point]::new(($form.Width - $searchBox.Width) / 5, $labelTitle.Bottom + 10)
$form.Controls.Add($searchBox)

# Gestionnaire d'événements pour le redimensionnement de la forme
$form.add_Resize({
    $searchBox.Width = [math]::round($form.Width * $searchBoxWidthPercentage)
    $searchBox.Location = [System.Drawing.Point]::new(($form.Width - $searchBox.Width) / 5, $labelTitle.Bottom + 10)
})

