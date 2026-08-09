param(
    [switch]$CheckOnly,
    [switch]$Build
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   iOS Swift Builder for Windows" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

if ($CheckOnly) {
    Write-Host "Verificando entorno..."
    $swiftPath = Get-Command "swift" -ErrorAction SilentlyContinue
    if ($swiftPath) { Write-Host "[OK] Swift Toolchain encontrado." -ForegroundColor Green } 
    else { Write-Host "[WARNING] Swift no instalado." -ForegroundColor Yellow }
    
    $gitPath = Get-Command "git" -ErrorAction SilentlyContinue
    if ($gitPath) { Write-Host "[OK] Git encontrado." -ForegroundColor Green }
    else { Write-Host "[WARNING] Git no instalado. Requerido para Cloud Build." -ForegroundColor Yellow }

    $ghPath = Get-Command "gh" -ErrorAction SilentlyContinue
    if ($ghPath) { Write-Host "[OK] GitHub CLI encontrado." -ForegroundColor Green }
    else { Write-Host "[WARNING] GitHub CLI (gh) no instalado. Usa: winget install GitHub.cli" -ForegroundColor Yellow }
    exit 0
}

if ($Build) {
    Write-Host "Iniciando compilación en la nube (GitHub Actions)..." -ForegroundColor Yellow
    
    $gitPath = Get-Command "git" -ErrorAction SilentlyContinue
    if (-not $gitPath) {
        Write-Host "[ERROR] Necesitas Git para enviar el código a GitHub." -ForegroundColor Red
        Write-Host "Instálalo y REINICIA LA CONSOLA: winget install Git.Git" -ForegroundColor Red
        exit 1
    }
    
    $ghPath = Get-Command "gh" -ErrorAction SilentlyContinue
    if (-not $ghPath) {
        Write-Host "[ERROR] Necesitas GitHub CLI para disparar el build automáticamente." -ForegroundColor Red
        Write-Host "Instálalo y REINICIA LA CONSOLA: winget install GitHub.cli" -ForegroundColor Red
        exit 1
    }
    
    Write-Host "Asegurando que los cambios estén en GitHub..."
    git add .
    git commit -m "Trigger Cloud Build"
    
    Write-Host "Subiendo código a GitHub..."
    git push origin HEAD
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] ¡Falló la subida a GitHub! (git push falló)." -ForegroundColor Red
        Write-Host "Por favor revisa el error arriba. El código no subió a la nube." -ForegroundColor Yellow
        exit 1
    }
    
    Write-Host "Disparando el Mac Runner en GitHub Actions..." -ForegroundColor Cyan
    gh workflow run ios-build.yml
    
    Write-Host "[EXITO] Compilación disparada en la nube." -ForegroundColor Green
    Write-Host "Puedes ver el progreso ejecutando: gh run list" -ForegroundColor Yellow
    exit 0
}

Write-Host "Opciones disponibles:"
Write-Host "  1. ./builder.ps1 -CheckOnly (Verificar dependencias)"
Write-Host "  2. ./builder.ps1 -Build (Compilar iOS en la nube)"
