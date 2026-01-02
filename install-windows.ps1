# Fastfetch Windows Installation Script
# Este script instala a configuração do Fastfetch no Windows
# This script installs the Fastfetch configuration on Windows

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  Fastfetch Configuration Setup  " -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se o Fastfetch está instalado / Check if Fastfetch is installed
$fastfetchPath = Get-Command fastfetch -ErrorAction SilentlyContinue

if (-not $fastfetchPath) {
    Write-Host "⚠️  Fastfetch não está instalado! / Fastfetch is not installed!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Você pode instalar usando: / You can install using:" -ForegroundColor White
    Write-Host "  Scoop:       scoop install fastfetch" -ForegroundColor Green
    Write-Host "  Chocolatey:  choco install fastfetch" -ForegroundColor Green
    Write-Host "  Manual:      https://github.com/fastfetch-cli/fastfetch/releases" -ForegroundColor Green
    Write-Host ""
    $continue = Read-Host "Deseja continuar mesmo assim? (s/N) / Continue anyway? (y/N)"
    if ($continue -notmatch '^[sySy]$') {
        exit 1
    }
}
else {
    Write-Host "✅ Fastfetch encontrado em: $($fastfetchPath.Source)" -ForegroundColor Green
    Write-Host ""
}

# Criar diretório de configuração / Create configuration directory
$configPath = "$env:USERPROFILE\.config\fastfetch"
Write-Host "📁 Criando diretório de configuração... / Creating configuration directory..." -ForegroundColor Cyan

if (-not (Test-Path $configPath)) {
    New-Item -ItemType Directory -Force -Path $configPath | Out-Null
    Write-Host "✅ Diretório criado: $configPath" -ForegroundColor Green
}
else {
    Write-Host "ℹ️  Diretório já existe: $configPath" -ForegroundColor Yellow
}
Write-Host ""

# Copiar arquivo de configuração / Copy configuration file
$sourceConfig = "config.jsonc"
$destConfig = "$configPath\config.jsonc"

if (Test-Path $sourceConfig) {
    Write-Host "📝 Copiando arquivo de configuração... / Copying configuration file..." -ForegroundColor Cyan
    
    # Backup da configuração existente / Backup existing configuration
    if (Test-Path $destConfig) {
        $backupPath = "$destConfig.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        Copy-Item $destConfig $backupPath
        Write-Host "⚠️  Backup da configuração antiga criado: $backupPath" -ForegroundColor Yellow
    }
    
    Copy-Item $sourceConfig $destConfig -Force
    Write-Host "✅ Configuração instalada com sucesso!" -ForegroundColor Green
}
else {
    Write-Host "❌ Arquivo config.jsonc não encontrado!" -ForegroundColor Red
    Write-Host "   Certifique-se de executar este script no diretório do repositório." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  Instalação Concluída! / Done!  " -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Execute 'fastfetch' para ver o resultado! / Run 'fastfetch' to see the result!" -ForegroundColor Green
Write-Host ""

# Perguntar se deseja executar o Fastfetch / Ask if user wants to run Fastfetch
$run = Read-Host "Deseja executar o Fastfetch agora? (s/N) / Run Fastfetch now? (y/N)"
if ($run -match '^[sySy]$') {
    Write-Host ""
    if ($fastfetchPath) {
        & fastfetch
    }
    else {
        Write-Host "❌ Fastfetch não está instalado. Instale-o primeiro! / Fastfetch is not installed. Please install it first!" -ForegroundColor Red
    }
}
