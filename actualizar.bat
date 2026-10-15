@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
title Actualizar Marca Personal - Kike Junior

echo ========================================================
echo   ⚡ KIKE JUNIOR • ACTUALIZADOR AUTOMATICO DE GITHUB ⚡
echo ========================================================
echo.

:: Obtener mensaje de commit
set "MSG=%~1"
if "%MSG%"=="" (
    set /p "MSG=Ingresa la descripcion de los cambios (o presiona ENTER para mensaje automatico): "
)

if "%MSG%"=="" (
    for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set mydate=%%a-%%b-%%c
    for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a:%%b
    set "MSG=Actualizacion de Marca Personal - !mydate! !mytime!"
)

echo.
echo [1/3] Agregando archivos modificados (git add .)...
git add .

echo.
echo [2/3] Creando commit: "!MSG!"...
git commit -m "!MSG!"

echo.
echo [3/3] Subiendo cambios a GitHub (git push origin main)...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo   ✅ CAMBIOS SUBIDOS EXITOSAMENTE A TU REPOSITORIO
    echo   🌐 https://github.com/enrique-camargo/marca-personal
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo   ❌ Ocurrio un error al subir los cambios a GitHub.
    echo   Revisa tu conexion o permisos de acceso a tu cuenta.
    echo ========================================================
)

echo.
if "%~1"=="" pause
