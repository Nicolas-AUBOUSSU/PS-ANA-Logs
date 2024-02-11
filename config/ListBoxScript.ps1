$form.add_Resize({
    $menu.Width = [math]::Round($form.Width * 0.9) # 90% de la largeur de la form
})



# liste box de sélection
$menu = New-Object System.Windows.Forms.ListBox
$menu.Width = 280
$menu.Height = 350
$menu.Font = New-Object System.Drawing.Font("Calibri", 12)
$menu.Location = [System.Drawing.Point]::new(($form.Width - $menu.Width) / 5, $BoutonExecute.Bottom + 10)
$menu.ScrollAlwaysVisible = $true  
$menu.HorizontalScrollbar = $true
$form.Controls.Add($menu)
