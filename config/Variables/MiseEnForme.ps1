# Importer les données des fichiers CSV
$Colorbackground = Get-Content -Path "a:\config\Variables\Color\Colorbackground.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

$ColorBoutonbackground = Get-Content -Path "a:\config\Variables\Color\ColorBoutonbackground.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }
$ColorBoutonbackgroundSurvol = Get-Content -Path "a:\config\Variables\Color\ColorBoutonbackgroundSurvol.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

$ColorBoutonTexte = Get-Content -Path "a:\config\Variables\Color\ColorBoutonTexte.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }
$ColorBoutonTexteSurvol = Get-Content -Path "a:\config\Variables\Color\ColorBoutonTexteSurvol.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

$ColorTitreBarreDeRecherche = Get-Content -Path "a:\config\Variables\Color\ColorTitreBarreDeRecherche.csv" | ForEach-Object { [System.Drawing.Color]::FromArgb(255, $_) }

# Créer l'objet $labelTitle
$labelTitle = New-Object System.Windows.Forms.Label

# Définir la couleur du titre de la barre de recherche
$labelTitle.ForeColor = $ColorTitreBarreDeRecherche

# Définir la couleur de fond du formulaire
$form.BackColor = $Colorbackground

# Configuration normale du bouton
$Bouton_1_Variables = @{
    Width = 220
    Height = 22
    BackColor = $ColorBoutonbackground
    ForeColor = $ColorBoutonTexte
    Font = New-Object System.Drawing.Font('Calibri', 8, [System.Drawing.FontStyle]::Bold)
    FlatStyle = 'Standard'    
}

# Configuration pour le survol du bouton
$Bouton_1_survole_Variables = @{
    BackColor = $ColorBoutonbackgroundSurvol
    ForeColor = $ColorBoutonTexteSurvol
    FlatStyle = 'Flat'   
}
