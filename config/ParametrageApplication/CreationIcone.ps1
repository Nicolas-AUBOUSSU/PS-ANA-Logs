################################
#                              #
#    création de l'icone       #
#                              #
################################

# Chemin de l'icone par défaut
$cheminIconeDefaut =  "A:\PS_ANA-Logs\config\img\raccourci.ico"

# Chemin de l'exécutable ImageMagick
$cheminImageMagick = "A:\PS_ANA-Logs\OpenSoftwareCenter\ImageMagick\magick.exe"

$reponse = Read-Host "Voulez-vous choisir une icone personnalisée pour le raccourci ? (O/N)"

if ($reponse -eq 'O') {
    Add-Type -AssemblyName System.Windows.Forms
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.Filter = "Images (*.gif, *.jpg, *.png, *.ico)|*.gif;*.jpg;*.jpeg;*.png;*.ico"
    
    $result = $fileDialog.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $cheminImageSelectionnee = $fileDialog.FileName
        $extension = [System.IO.Path]::GetExtension($cheminImageSelectionnee)

        if ($extension -ne '.ico') {
            $cheminIconeConvertie = [System.IO.Path]::ChangeExtension($cheminImageSelectionnee, '.ico')
            & $cheminImageMagick convert $cheminImageSelectionnee -resize 256x256 -define icon:auto-resize -colors 256 $cheminIconeConvertie

            if (Test-Path $cheminIconeConvertie) {
                Copy-Item $cheminIconeConvertie -Destination $cheminIconeDefaut -Force
                Write-Host "L'icone a été mise à jour."
            } else {
                Write-Host "La conversion de l'icone a échoué."
            }
        } else {
            Copy-Item $cheminImageSelectionnee -Destination $cheminIconeDefaut -Force
            Write-Host "L'icone a été mise à jour."
        }
    }
} elseif ($reponse -eq 'N') {
    Write-Host "L'icone par défaut sera utilisée."
} else {
    Write-Host "Réponse non valide. Veuillez entrer 'O' ou 'N'."
}
