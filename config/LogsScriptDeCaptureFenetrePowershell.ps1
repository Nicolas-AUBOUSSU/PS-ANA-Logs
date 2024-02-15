# Trouver la valeur dans un fichier CSV
$csvPath = "A:\PS_ANA-Logs\config\Variables\Script_a_Lancer\$($env:COMPUTERNAME)_$($env:USERNAME).csv"
 
$selectedScript = Get-Content $csvPath
 
 
$currentUser = $env:USERNAME
$date = Get-Date -Format "yyyyMMdd_HHmmss"
$logFolder = "A:\PS_ANA-Logs\log\ScriptExecute\$env:COMPUTERNAME"
$logFileName = "${selectedScript}_${currentUser}_$date.log"
$logPath = Join-Path -Path $logFolder -ChildPath $logFileName

# Pour savoir si le script est exécuté en tant qu'administrateur
try {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    if ($principal.IsInRole($adminRole)) {
        $action = "EXECUTER EN ADMIN"
    } else {
        $action = "EXECUTER NORMALEMENT"
    }
} catch {
    $action = "Erreur lors de la détection des droits d'administrateur"
}



$scriptName = $selectedScript
$CheminDesLogs =  $logPath

# Script pour l'ajout dans le fichier de logs bien mettre les variables 
& A:\PS_ANA-Logs\config\LogsFichierXLSX.ps1 -action $action -Script $scriptName -CheminDesLogs $CheminDesLogs

# ----------------------------------------------------------------------
# Capture fenetre powershell
# ----------------------------------------------------------------------
if (-not (Test-Path -Path $logFolder -PathType Container)) {
    New-Item -Path $logFolder -ItemType Directory -Force | Out-Null
}

Start-Transcript -Path $logPath -Append

function Write-Section($title) {
    Write-Output "`r`n`r`n`r`n`r`n`r`n$action"
    Write-Output "`r`n`r`n`r`n`r`n`r`n____________________________________________"
    Write-Output $title
    Write-Output "____________________________________________`r`n"
}

# -----------------------------------------------------------
# SECTION : CODE
# -----------------------------------------------------------
Write-Section "SECTION : CODE"
Get-Content -Path $selectedScript

# -----------------------------------------------------------
# SECTION : Résultat et saisie utilisateur
# -----------------------------------------------------------
Write-Section "SECTION : Résultat et saisie utilisateur"
Invoke-Expression "& '$selectedScript'"

# Arrêter la transcription
Stop-Transcript
