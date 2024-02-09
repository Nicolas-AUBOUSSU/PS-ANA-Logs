# Gestionnaire d'événements pour le redimensionnement de la forme
$form.add_Resize({
    $menu.Width = [math]::Round($form.Width * 0.8) # 80% de la largeur de la form
    $menu.Location = [System.Drawing.Point]::new(($form.Width - $menu.Width) / 5, $BoutonExecute.Bottom + 10)
})


# liste box de sélection
$menu = New-Object System.Windows.Forms.ListBox
$menu.Width = 260
$menu.Height = 350
$menu.Location = [System.Drawing.Point]::new(($form.Width - $menu.Width) / 5, $BoutonExecute.Bottom + 10)
$menu.ScrollAlwaysVisible = $true  
$menu.HorizontalScrollbar = $true
$form.Controls.Add($menu)
