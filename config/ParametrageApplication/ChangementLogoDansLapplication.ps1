##########################################
#                                        #
#    changement du logo dans l'appli     #
#                                        #
##########################################

# Ouvrez une boÃ®te de dialogue pour sÃ©lectionner l'image
write-host "SÃ©lectionnez l'image Ã  utiliser pour le logo de l'application. (jpg, png, gif)"
write-host "L'image doit Ãªtre carrÃ©e et avoir une taille de 256x256 pixels. sinon elle sera redimensionnÃ©e."
write-host "attention l'explorateur de fichier peut Ãªtre cachÃ© derriÃ¨re la fenÃªtre de PowerShell."
Add-Type -AssemblyName System.Windows.Forms
$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.Filter = "Images (*.jpg;*.pdn;*.gif)|*.jpg;*.pdn;*.gif"
$result = $dialog.ShowDialog()

# VÃ©rifiez si l'utilisateur a sÃ©lectionnÃ© un fichier
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $imagePath = $dialog.FileName

    # DÃ©finissez le chemin vers l'exÃ©cutable ImageMagick
    $magickPath = "config\img\ImageMagick\magick.exe"

    # DÃ©finissez le chemin de destination
    $destinationPath = "config\img\logo.gif"

    # DÃ©finissez les nouvelles dimensions souhaitÃ©es
    $targetWidth = 780
    $targetHeight = 240

    # Obtenez les dimensions de l'image originale
    $image = [System.Drawing.Image]::FromFile($imagePath)
    $originalWidth = $image.Width
    $originalHeight = $image.Height
    $image.Dispose()

    # Calculez les nouvelles dimensions tout en conservant les proportions
    $ratio = [math]::Min($targetWidth / $originalWidth, $targetHeight / $originalHeight)
    $newWidth = [math]::Round($originalWidth * $ratio)
    $newHeight = [math]::Round($originalHeight * $ratio)

    # Construisez la commande ImageMagick
    $command = "& `"$magickPath`" `"$imagePath`" -resize ${newWidth}x${newHeight} ``
    -background transparent -gravity center -extent ${targetWidth}x${targetHeight} `"$destinationPath`""

    # ExÃ©cutez la commande ImageMagick
    Invoke-Expression $command

    # VÃ©rifiez si l'image a Ã©tÃ© crÃ©Ã©e avec succÃ¨s
    if (Test-Path $destinationPath) {
        Write-Host "L'image a Ã©tÃ© redimensionnÃ©e et enregistrÃ©e avec succÃ¨s en tant que logo.gif"
    } else {
        Write-Host "Il y a eu une erreur lors de la crÃ©ation de l'image."
    }
} else {
    Write-Host "Aucun fichier n'a Ã©tÃ© sÃ©lectionnÃ©."
}
