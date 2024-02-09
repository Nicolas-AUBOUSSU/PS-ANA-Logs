# Chemin vers le fichier CSV
$csvPath = "a:\config\img\NomDesIMG.csv"
# Lire le fichier CSV et stocker la première ligne de la colonne 'logo' dans la variable $imagePath
$imagePath = Join-Path -Path $PSScriptRoot -ChildPath (Import-Csv -Path $csvPath -Delimiter ';' | Select-Object -ExpandProperty logo -First 1)


Write-Host = $imagePath

# Créer une instance de PictureBox
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Size = New-Object System.Drawing.Size(210, 65)
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$pictureBox.Location = [System.Drawing.Point]::new(35, 10) # Gauche, Haut
# Charger l'image
$image = [System.Drawing.Image]::FromFile($imagePath)
$pictureBox.Image = $image

# Ajouter le PictureBox au formulaire
$form.Controls.Add($pictureBox)
