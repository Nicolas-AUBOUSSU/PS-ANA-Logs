# Importation de l'assembly nécessaire à la création de formulaires
Add-Type -AssemblyName System.Windows.Forms

# Chargement de la couleur à partir du fichier CSV pour Colorbackground
$colorBackground = Get-Content -Path "a:\config\Variables\Color\Colorbackground.csv"

# Chargement de la couleur à partir du fichier CSV pour ColorBoutonbackground
$colorBoutonBackground = Get-Content -Path "a:\config\Variables\Color\ColorBoutonbackground.csv"

# Chargement de la couleur à partir du fichier CSV pour ColorBoutonTexte
$colorBoutonTexte = Get-Content -Path "a:\config\Variables\Color\ColorBoutonTexte.csv"

# Chargement de la couleur à partir du fichier CSV pour ColorBoutonTexteSurvol
$colorBoutonTexteSurvol = Get-Content -Path "a:\config\Variables\Color\ColorBoutonTexteSurvol.csv"

# Chargement de la couleur à partir du fichier CSV pour ColorTitreBarreDeRecherche
$colorTitreBarreDeRecherche = Get-Content -Path "a:\config\Variables\Color\ColorTitreBarreDeRecherche.csv"

# Chargement de la couleur à partir du fichier CSV pour ColorBoutonbackgroundSurvol
$ColorBoutonbackgroundSurvol = Get-Content -Path "a:\config\Variables\Color\ColorBoutonbackgroundSurvol.csv"

# Fonction pour gérer l'événement Click du bouton
function Select-Color {
    param(
        [string]$colorName,
        [System.Windows.Forms.Panel]$rectangle
    )

    $colorDialog = New-Object System.Windows.Forms.ColorDialog

    # Afficher la palette de couleur
    $result = $colorDialog.ShowDialog()

    # Vérifier si l'utilisateur a sélectionné une couleur
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        # Obtenir la couleur sélectionnée
        $selectedColor = $colorDialog.Color

        # Convertir la couleur en format "255,255,255"
        $formattedColor = "$($selectedColor.R),$($selectedColor.G),$($selectedColor.B)"

        # Sauvegarder la couleur dans le fichier CSV correspondant
        $formattedColor | Out-File -FilePath "a:\config\Variables\Color\$colorName.csv" -Force
        Write-Host "Couleur mise à jour : $formattedColor pour $colorName"

        # Mettre à jour la couleur du rectangle dans le formulaire
        $rectangle.BackColor = [System.Drawing.Color]::FromArgb(255, $selectedColor)
    }
}

# Création du formulaire
$form = New-Object System.Windows.Forms.Form
$form.Text = "Aperçus et modification des couleurs contenues dans des CSV"
$form.Width = 650  # Ajustez la largeur du formulaire
$form.Height = 630 # Ajustez la hauteur en fonction du nombre de couleurs

# Position Y de départ pour le premier panneau
$y = 20

# Création du panneau pour Colorbackground avec une étiquette, un rectangle coloré et un bouton de sélection de couleur
$panelBackground = New-Object System.Windows.Forms.Panel
$panelBackground.Width = $form.Width
$panelBackground.Height = 80 # Ajustez la hauteur du panneau en fonction des besoins
$panelBackground.Location = New-Object System.Drawing.Point(0, $y)

# Créer une étiquette pour Colorbackground
$labelBackground = New-Object System.Windows.Forms.Label
$labelBackground.Text = "Colorbackground"
$labelBackground.Width = 200  # Ajustez la largeur de l'étiquette
$labelBackground.Location = New-Object System.Drawing.Point(10, 10)
$panelBackground.Controls.Add($labelBackground)

# Créer un rectangle pour Colorbackground
$rectangleBackground = New-Object System.Windows.Forms.Panel
$rectangleBackground.Width = 60
$rectangleBackground.Height = 60
$rectangleBackground.Location = New-Object System.Drawing.Point(220, 10)
$rectangleBackground.BackColor = [System.Drawing.Color]::FromArgb(255, $colorBackground)
$panelBackground.Controls.Add($rectangleBackground)

# Créer un bouton de sélection de couleur pour Colorbackground
$colorButtonBackground = New-Object System.Windows.Forms.Button
$colorButtonBackground.Text = "Choisir la couleur de Colorbackground"
$colorButtonBackground.Width = 300  # Ajustez la largeur du bouton
$colorButtonBackground.Location = New-Object System.Drawing.Point(300, 10)

# Gérer l'événement Click du bouton en utilisant la fonction Select-Color pour Colorbackground
$colorButtonBackground.Add_Click({
    Select-Color -colorName "Colorbackground" -rectangle $rectangleBackground
})

# Ajouter le bouton au panneau pour Colorbackground
$panelBackground.Controls.Add($colorButtonBackground)

# Ajouter le panneau pour Colorbackground au formulaire
$form.Controls.Add($panelBackground)
$y += $panelBackground.Height + 10 # Espacement entre les panneaux

# Création du panneau pour ColorBoutonbackground avec une étiquette, un rectangle coloré et un bouton de sélection de couleur
$panelBoutonBackground = New-Object System.Windows.Forms.Panel
$panelBoutonBackground.Width = $form.Width
$panelBoutonBackground.Height = 80 # Ajustez la hauteur du panneau en fonction des besoins
$panelBoutonBackground.Location = New-Object System.Drawing.Point(0, $y)

# Créer une étiquette pour ColorBoutonbackground
$labelBoutonBackground = New-Object System.Windows.Forms.Label
$labelBoutonBackground.Text = "ColorBoutonbackground"
$labelBoutonBackground.Width = 200  # Ajustez la largeur de l'étiquette
$labelBoutonBackground.Location = New-Object System.Drawing.Point(10, 10)
$panelBoutonBackground.Controls.Add($labelBoutonBackground)

# Créer un rectangle pour ColorBoutonbackground
$rectangleBoutonBackground = New-Object System.Windows.Forms.Panel
$rectangleBoutonBackground.Width = 60
$rectangleBoutonBackground.Height = 60
$rectangleBoutonBackground.Location = New-Object System.Drawing.Point(220, 10)
$rectangleBoutonBackground.BackColor = [System.Drawing.Color]::FromArgb(255, $colorBoutonBackground)
$panelBoutonBackground.Controls.Add($rectangleBoutonBackground)

# Créer un bouton de sélection de couleur pour ColorBoutonbackground
$colorButtonBoutonBackground = New-Object System.Windows.Forms.Button
$colorButtonBoutonBackground.Text = "Choisir la couleur de ColorBoutonbackground"
$colorButtonBoutonBackground.Width = 300  # Ajustez la largeur du bouton
$colorButtonBoutonBackground.Location = New-Object System.Drawing.Point(300, 10)

# Gérer l'événement Click du bouton en utilisant la fonction Select-Color pour ColorBoutonbackground
$colorButtonBoutonBackground.Add_Click({
    Select-Color -colorName "ColorBoutonbackground" -rectangle $rectangleBoutonBackground
})

# Ajouter le bouton au panneau pour ColorBoutonbackground
$panelBoutonBackground.Controls.Add($colorButtonBoutonBackground)

# Ajouter le panneau pour ColorBoutonbackground au formulaire
$form.Controls.Add($panelBoutonBackground)
$y += $panelBoutonBackground.Height + 10 # Espacement entre les panneaux

# Création du panneau pour ColorBoutonTexte avec une étiquette, un rectangle coloré et un bouton de sélection de couleur
$panelBoutonTexte = New-Object System.Windows.Forms.Panel
$panelBoutonTexte.Width = $form.Width
$panelBoutonTexte.Height = 80 # Ajustez la hauteur du panneau en fonction des besoins
$panelBoutonTexte.Location = New-Object System.Drawing.Point(0, $y)

# Créer une étiquette pour ColorBoutonTexte
$labelBoutonTexte = New-Object System.Windows.Forms.Label
$labelBoutonTexte.Text = "ColorBoutonTexte"
$labelBoutonTexte.Width = 200  # Ajustez la largeur de l'étiquette
$labelBoutonTexte.Location = New-Object System.Drawing.Point(10, 10)
$panelBoutonTexte.Controls.Add($labelBoutonTexte)

# Créer un rectangle pour ColorBoutonTexte
$rectangleBoutonTexte = New-Object System.Windows.Forms.Panel
$rectangleBoutonTexte.Width = 60
$rectangleBoutonTexte.Height = 60
$rectangleBoutonTexte.Location = New-Object System.Drawing.Point(220, 10)
$rectangleBoutonTexte.BackColor = [System.Drawing.Color]::FromArgb(255, $colorBoutonTexte)
$panelBoutonTexte.Controls.Add($rectangleBoutonTexte)

# Créer un bouton de sélection de couleur pour ColorBoutonTexte
$colorButtonBoutonTexte = New-Object System.Windows.Forms.Button
$colorButtonBoutonTexte.Text = "Choisir la couleur de ColorBoutonTexte"
$colorButtonBoutonTexte.Width = 300  # Ajustez la largeur du bouton
$colorButtonBoutonTexte.Location = New-Object System.Drawing.Point(300, 10)

# Gérer l'événement Click du bouton en utilisant la fonction Select-Color pour ColorBoutonTexte
$colorButtonBoutonTexte.Add_Click({
    Select-Color -colorName "ColorBoutonTexte" -rectangle $rectangleBoutonTexte
})

# Ajouter le bouton au panneau pour ColorBoutonTexte
$panelBoutonTexte.Controls.Add($colorButtonBoutonTexte)

# Ajouter le panneau pour ColorBoutonTexte au formulaire
$form.Controls.Add($panelBoutonTexte)
$y += $panelBoutonTexte.Height + 10 # Espacement entre les panneaux

# Création du panneau pour ColorBoutonTexteSurvol avec une étiquette, un rectangle coloré et un bouton de sélection de couleur
$panelBoutonTexteSurvol = New-Object System.Windows.Forms.Panel
$panelBoutonTexteSurvol.Width = $form.Width
$panelBoutonTexteSurvol.Height = 80 # Ajustez la hauteur du panneau en fonction des besoins
$panelBoutonTexteSurvol.Location = New-Object System.Drawing.Point(0, $y)

# Créer une étiquette pour ColorBoutonTexteSurvol
$labelBoutonTexteSurvol = New-Object System.Windows.Forms.Label
$labelBoutonTexteSurvol.Text = "ColorBoutonTexteSurvol"
$labelBoutonTexteSurvol.Width = 200  # Ajustez la largeur de l'étiquette
$labelBoutonTexteSurvol.Location = New-Object System.Drawing.Point(10, 10)
$panelBoutonTexteSurvol.Controls.Add($labelBoutonTexteSurvol)

# Créer un rectangle pour ColorBoutonTexteSurvol
$rectangleBoutonTexteSurvol = New-Object System.Windows.Forms.Panel
$rectangleBoutonTexteSurvol.Width = 60
$rectangleBoutonTexteSurvol.Height = 60
$rectangleBoutonTexteSurvol.Location = New-Object System.Drawing.Point(220, 10)
$rectangleBoutonTexteSurvol.BackColor = [System.Drawing.Color]::FromArgb(255, $colorBoutonTexteSurvol)
$panelBoutonTexteSurvol.Controls.Add($rectangleBoutonTexteSurvol)

# Créer un bouton de sélection de couleur pour ColorBoutonTexteSurvol
$colorButtonBoutonTexteSurvol = New-Object System.Windows.Forms.Button
$colorButtonBoutonTexteSurvol.Text = "Choisir la couleur de ColorBoutonTexteSurvol"
$colorButtonBoutonTexteSurvol.Width = 300  # Ajustez la largeur du bouton
$colorButtonBoutonTexteSurvol.Location = New-Object System.Drawing.Point(300, 10)

# Gérer l'événement Click du bouton en utilisant la fonction Select-Color pour ColorBoutonTexteSurvol
$colorButtonBoutonTexteSurvol.Add_Click({
    Select-Color -colorName "ColorBoutonTexteSurvol" -rectangle $rectangleBoutonTexteSurvol
})

# Ajouter le bouton au panneau pour ColorBoutonTexteSurvol
$panelBoutonTexteSurvol.Controls.Add($colorButtonBoutonTexteSurvol)

# Ajouter le panneau pour ColorBoutonTexteSurvol au formulaire
$form.Controls.Add($panelBoutonTexteSurvol)
$y += $panelBoutonTexteSurvol.Height + 10 # Espacement entre les panneaux

# Création du panneau pour ColorTitreBarreDeRecherche avec une étiquette, un rectangle coloré et un bouton de sélection de couleur
$panelTitreBarreDeRecherche = New-Object System.Windows.Forms.Panel
$panelTitreBarreDeRecherche.Width = $form.Width
$panelTitreBarreDeRecherche.Height = 80 # Ajustez la hauteur du panneau en fonction des besoins
$panelTitreBarreDeRecherche.Location = New-Object System.Drawing.Point(0, $y)

# Créer une étiquette pour ColorTitreBarreDeRecherche
$labelTitreBarreDeRecherche = New-Object System.Windows.Forms.Label
$labelTitreBarreDeRecherche.Text = "ColorTitreBarreDeRecherche"
$labelTitreBarreDeRecherche.Width = 200  # Ajustez la largeur de l'étiquette
$labelTitreBarreDeRecherche.Location = New-Object System.Drawing.Point(10, 10)
$panelTitreBarreDeRecherche.Controls.Add($labelTitreBarreDeRecherche)

# Créer un rectangle pour ColorTitreBarreDeRecherche
$rectangleTitreBarreDeRecherche = New-Object System.Windows.Forms.Panel
$rectangleTitreBarreDeRecherche.Width = 60
$rectangleTitreBarreDeRecherche.Height = 60
$rectangleTitreBarreDeRecherche.Location = New-Object System.Drawing.Point(220, 10)
$rectangleTitreBarreDeRecherche.BackColor = [System.Drawing.Color]::FromArgb(255, $colorTitreBarreDeRecherche)
$panelTitreBarreDeRecherche.Controls.Add($rectangleTitreBarreDeRecherche)

# Créer un bouton de sélection de couleur pour ColorTitreBarreDeRecherche
$colorButtonTitreBarreDeRecherche = New-Object System.Windows.Forms.Button
$colorButtonTitreBarreDeRecherche.Text = "Choisir la couleur de ColorTitreBarreDeRecherche"
$colorButtonTitreBarreDeRecherche.Width = 300  # Ajustez la largeur du bouton
$colorButtonTitreBarreDeRecherche.Location = New-Object System.Drawing.Point(300, 10)

# Gérer l'événement Click du bouton en utilisant la fonction Select-Color pour ColorTitreBarreDeRecherche
$colorButtonTitreBarreDeRecherche.Add_Click({
    Select-Color -colorName "ColorTitreBarreDeRecherche" -rectangle $rectangleTitreBarreDeRecherche
})

# Ajouter le bouton au panneau pour ColorTitreBarreDeRecherche
$panelTitreBarreDeRecherche.Controls.Add($colorButtonTitreBarreDeRecherche)

# Ajouter le panneau pour ColorTitreBarreDeRecherche au formulaire
$form.Controls.Add($panelTitreBarreDeRecherche)
$y += $panelTitreBarreDeRecherche.Height + 10 # Espacement entre les panneaux

# Création du panneau pour ColorBoutonbackgroundSurvol avec une étiquette, un rectangle coloré et un bouton de sélection de couleur
$panelBoutonCadre = New-Object System.Windows.Forms.Panel
$panelBoutonCadre.Width = $form.Width
$panelBoutonCadre.Height = 80 # Ajustez la hauteur du panneau en fonction des besoins
$panelBoutonCadre.Location = New-Object System.Drawing.Point(0, $y)

# Créer une étiquette pour ColorBoutonbackgroundSurvol
$labelBoutonCadre = New-Object System.Windows.Forms.Label
$labelBoutonCadre.Text = "ColorBoutonbackgroundSurvol"
$labelBoutonCadre.Width = 200  # Ajustez la largeur de l'étiquette
$labelBoutonCadre.Location = New-Object System.Drawing.Point(10, 10)
$panelBoutonCadre.Controls.Add($labelBoutonCadre)

# Créer un rectangle pour ColorBoutonbackgroundSurvol
$rectangleBoutonCadre = New-Object System.Windows.Forms.Panel
$rectangleBoutonCadre.Width = 60
$rectangleBoutonCadre.Height = 60
$rectangleBoutonCadre.Location = New-Object System.Drawing.Point(220, 10)
$rectangleBoutonCadre.BackColor = [System.Drawing.Color]::FromArgb(255, $ColorBoutonbackgroundSurvol)
$panelBoutonCadre.Controls.Add($rectangleBoutonCadre)

# Créer un bouton de sélection de couleur pour ColorBoutonbackgroundSurvol
$ColorBoutonbackgroundSurvol = New-Object System.Windows.Forms.Button
$ColorBoutonbackgroundSurvol.Text = "Choisir la couleur de ColorBoutonbackgroundSurvol"
$ColorBoutonbackgroundSurvol.Width = 300  # Ajustez la largeur du bouton
$ColorBoutonbackgroundSurvol.Location = New-Object System.Drawing.Point(300, 10)

# Gérer l'événement Click du bouton en utilisant la fonction Select-Color pour ColorBoutonbackgroundSurvol
$ColorBoutonbackgroundSurvol.Add_Click({
    Select-Color -colorName "ColorBoutonbackgroundSurvol" -rectangle $rectangleBoutonCadre
})

# Ajouter le bouton au panneau pour ColorBoutonbackgroundSurvol
$panelBoutonCadre.Controls.Add($ColorBoutonbackgroundSurvol)

# Ajouter le panneau pour ColorBoutonbackgroundSurvol au formulaire
$form.Controls.Add($panelBoutonCadre)


# Ajouter une étiquette en bas
$label = New-Object System.Windows.Forms.Label
$label.Text = "Une fois la sélection faite, Fermer la fenêtre"
$label.Font = New-Object System.Drawing.Font("Arial", 14) 
$label.Dock = "Bottom"
$label.Margin = New-Object System.Windows.Forms.Padding(0, 0, 0, 10)  # Ajoute un espace de 10 pixels vers le haut
$form.Controls.Add($label)


# Afficher le formulaire
[Windows.Forms.Application]::Run($form)
