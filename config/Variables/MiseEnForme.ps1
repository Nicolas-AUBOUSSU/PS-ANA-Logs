

# Importer les données des fichiers CSV
$Colorbackground = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\Color\Colorbackground.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

$ColorBoutonbackground = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\Color\ColorBoutonbackground.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }
$ColorBoutonbackgroundSurvol = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\Color\ColorBoutonbackgroundSurvol.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

$ColorBoutonTexte = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\Color\ColorBoutonTexte.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }
$ColorBoutonTexteSurvol = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\Color\ColorBoutonTexteSurvol.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

# Titre "Rechercher"
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "Rechercher :"
$labelTitle.Font = New-Object System.Drawing.Font("Calibri", 17)
$labelTitle.AutoSize = $true  # Permet au label de s'ajuster automatiquement à la largeur du texte

# Fixer la position horizontale et verticale
$labelTitle.Anchor = [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right

$labelTitle.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$labelTitle.Location = [System.Drawing.Point]::new(0, 85)

# Ajouter le label au formulaire
$form.Controls.Add($labelTitle)

# Importer les données des fichiers CSV
$ColorTitreBarreDeRecherche = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\Color\ColorTitreBarreDeRecherche.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

# Définir la couleur du titre de la barre de recherche
$labelTitle.ForeColor = $ColorTitreBarreDeRecherche

# Définir la couleur de fond du formulaire
$form.BackColor = $Colorbackground

# Configuration normale du bouton
$Bouton_1_Variables = @{
    Width = 280
    Height = 26
    BackColor = $ColorBoutonbackground
    ForeColor = $ColorBoutonTexte
    Font = New-Object System.Drawing.Font('Calibri', 10, [System.Drawing.FontStyle]::Bold)
    FlatStyle = 'Standard'    
}

# Configuration pour le survol du bouton
$Bouton_1_survole_Variables = @{
    BackColor = $ColorBoutonbackgroundSurvol
    ForeColor = $ColorBoutonTexteSurvol
    FlatStyle = 'Flat'   
}
