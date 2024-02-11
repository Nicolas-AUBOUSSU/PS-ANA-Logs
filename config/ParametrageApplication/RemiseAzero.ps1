# Récupérer le nom de l'application
$NomApplication = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\NomApplication.txt"
$MAJraccourci =$MAJraccourci = Get-Content -Path "A:\PS_ANA-Logs\config\Variables\MAJraccourci.txt"

# Supprimer les fichiers
Remove-Item -Path A:\PS_ANA-Logs\_lanceur.bat -Force
Remove-Item -Path "A:\PS_ANA-Logs\GPO_$NomApplication.ps1" -Force
Remove-Item -Path "C:\Temp\$NomApplication.ico" -Force
Remove-Item -Path "C:\Temp\$MAJraccourci" -Force

# Supprimer le contenu des dossiers
Remove-Item -Path A:\PS_ANA-Logs\config\Variables\Tableur\* -Force
Remove-Item -Path A:\PS_ANA-Logs\config\Variables\Script_a_Lancer* -Force
Remove-Item -Path A:\PS_ANA-Logs\config\Variables\EditeurDeCode\* -Force
Remove-Item -Path A:\PS_ANA-Logs\log\ConsultationLogs\* -Force
Remove-Item -Path A:\PS_ANA-Logs\log\ScriptExecute\* -Force
Remove-Item -Path A:\PS_ANA-Logs\log\ScriptHistory\* -Force
Remove-Item -Path A:\PS_ANA-Logs\config\Variables\Raccourci\* -Force


# Copier le fichier logs_vide.xlsx dans le fichier logs.xlsx
Copy-Item -Path A:\PS_ANA-Logs\config\ParametrageApplication\logs_vide.xlsx -Destination A:\PS_ANA-Logs\log\logs.xlsx -Force

