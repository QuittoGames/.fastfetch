@echo off
REM Fastfetch Windows Installation Script
REM Este script instala a configuração do Fastfetch no Windows
REM This script installs the Fastfetch configuration on Windows

setlocal enabledelayedexpansion

echo ==================================
echo   Fastfetch Configuration Setup
echo ==================================
echo.

REM Verificar se o Fastfetch está instalado / Check if Fastfetch is installed
where fastfetch >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Fastfetch nao esta instalado! / Fastfetch is not installed!
    echo.
    echo Voce pode instalar usando: / You can install using:
    echo   Scoop:       scoop install fastfetch
    echo   Chocolatey:  choco install fastfetch
    echo   Manual:      https://github.com/fastfetch-cli/fastfetch/releases
    echo.
    set /p continue="Deseja continuar mesmo assim? (s/N) / Continue anyway? (y/N): "
    if /i not "!continue!"=="s" if /i not "!continue!"=="y" (
        exit /b 1
    )
) else (
    for /f "delims=" %%i in ('where fastfetch') do set FASTFETCH_PATH=%%i
    echo [OK] Fastfetch encontrado em: !FASTFETCH_PATH!
    echo.
)

REM Criar diretório de configuração / Create configuration directory
set CONFIG_PATH=%USERPROFILE%\.config\fastfetch
echo [*] Criando diretorio de configuracao... / Creating configuration directory...

if not exist "%CONFIG_PATH%" (
    mkdir "%CONFIG_PATH%"
    echo [OK] Diretorio criado: %CONFIG_PATH%
) else (
    echo [INFO] Diretorio ja existe: %CONFIG_PATH%
)
echo.

REM Copiar arquivo de configuração / Copy configuration file
set SOURCE_CONFIG=config.jsonc
set DEST_CONFIG=%CONFIG_PATH%\config.jsonc

if exist "%SOURCE_CONFIG%" (
    echo [*] Copiando arquivo de configuracao... / Copying configuration file...
    
    REM Backup da configuração existente / Backup existing configuration
    if exist "%DEST_CONFIG%" (
        REM Use a simple sequential backup method that works across all locales
        set BACKUP_NUM=1
        :find_backup_name
        set BACKUP_PATH=%DEST_CONFIG%.backup-!BACKUP_NUM!
        if exist "!BACKUP_PATH!" (
            set /a BACKUP_NUM+=1
            goto find_backup_name
        )
        copy "%DEST_CONFIG%" "!BACKUP_PATH!" >nul 2>&1
        if !errorlevel! equ 0 (
            echo [WARNING] Backup da configuracao antiga criado: !BACKUP_PATH!
        ) else (
            echo [WARNING] Nao foi possivel criar backup. Continuando...
        )
    )
    
    copy "%SOURCE_CONFIG%" "%DEST_CONFIG%" >nul 2>&1
    if !errorlevel! equ 0 (
        echo [OK] Configuracao instalada com sucesso!
    ) else (
        echo [ERROR] Falha ao copiar configuracao!
        exit /b 1
    )
) else (
    echo [ERROR] Arquivo config.jsonc nao encontrado!
    echo        Certifique-se de executar este script no diretorio do repositorio.
    exit /b 1
)

echo.
echo ==================================
echo   Instalacao Concluida! / Done!
echo ==================================
echo.
echo Execute 'fastfetch' para ver o resultado! / Run 'fastfetch' to see the result!
echo.

REM Perguntar se deseja executar o Fastfetch / Ask if user wants to run Fastfetch
set /p run="Deseja executar o Fastfetch agora? (s/N) / Run Fastfetch now? (y/N): "
if /i "!run!"=="s" goto runfastfetch
if /i "!run!"=="y" goto runfastfetch
goto end

:runfastfetch
echo.
where fastfetch >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Fastfetch nao esta instalado. Instale-o primeiro! / Fastfetch is not installed. Please install it first!
) else (
    fastfetch
)

:end
endlocal
