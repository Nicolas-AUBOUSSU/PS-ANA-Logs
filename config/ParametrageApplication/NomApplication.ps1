################################
#                              #
#    nom de l'application      #
#                              #
################################


[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$nomApplication = Get-Content -Path "config\Variables\NomApplication.txt"
$reponse = Read-Host "Voulez-vous changer le nom de l'application par dÃ©faut c'est $nomApplication ? (O/N)"  

switch ($reponse.ToUpper()) {
    "O" { 
        $nomApplication = Read-Host -Prompt "Entrez le nom que vous souhaitez pour l'application"
        $nomApplicationPath = Join-Path -Path $path -ChildPath "config\Variables\NomApplication.txt"
        $nomApplication | Set-Content -Path $nomApplicationPath -Encoding UTF8
        Write-Host "Le nom est maintenant $nomApplication"
    }
    "N" { Write-Host "Le nom reste $nomApplication" }
    default { Write-Host "RÃ©ponse non valide." }
}
