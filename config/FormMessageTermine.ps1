# Créer une forme de message
Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
$form.Text = "Message de confirmation"
$form.Size = New-Object Drawing.Size @(400, 150)
$form.StartPosition = "CenterScreen"
# Ajouter une étiquette avec le message
$label = New-Object System.Windows.Forms.Label
$label.Text = "Configuration terminée."
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(10,30)
$form.Controls.Add($label)

# Fermer la forme aprés 2 secondes
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
    $form.Close()
    $timer.Dispose()
})
$form.Add_Shown({ $timer.Start() })

# Afficher la forme
$form.ShowDialog()
