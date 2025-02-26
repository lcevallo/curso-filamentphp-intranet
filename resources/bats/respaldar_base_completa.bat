@echo off
setlocal

REM Ruta donde se encuentran los comandos de PostgreSQL
set "PG_BIN=C:\Program Files\PostgreSQL\16\bin"
set "PGPASSWORD=Passw0rd"
set "PGUSER=postgres"
set "PGDATABASE=isma"
set "PGHOST=127.0.0.1" REM IP del servidor remoto

REM Crear una variable con la ruta del directorio de respaldos y la fecha actual
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

REM Convertir el número del mes a su abreviatura en inglés
set "month_name="
if "%month%"=="01" set "month_name=Jan"
if "%month%"=="02" set "month_name=Feb"
if "%month%"=="03" set "month_name=Mar"
if "%month%"=="04" set "month_name=Apr"
if "%month%"=="05" set "month_name=May"
if "%month%"=="06" set "month_name=Jun"
if "%month%"=="07" set "month_name=Jul"
if "%month%"=="08" set "month_name=Aug"
if "%month%"=="09" set "month_name=Sep"
if "%month%"=="10" set "month_name=Oct"
if "%month%"=="11" set "month_name=Nov"
if "%month%"=="12" set "month_name=Dec"

for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "minute=%%b"
)

REM Obtener los segundos
for /f "tokens=1-2 delims=:. " %%a in ('echo %time%') do (
    set "second=%%b"
)

REM Eliminar espacios en blanco en las variables de hora, minuto y segundo
set "hour=%hour: =0%"
set "minute=%minute: =0%"
set "second=%second: =0%"

REM Crear la variable de fecha y hora en el formato deseado
set "fecha=%day%-%month_name%-%year%"
set "hora=%hour%-%minute%-%second%"

set "backup_dir=..\dumps\respaldos\%fecha%_%hora%"

REM Crear el directorio de respaldos
mkdir "%backup_dir%"
if errorlevel 1 (
    echo Error al crear el directorio de respaldos: %backup_dir%
    endlocal
    exit /b 1
)

REM Realizar el respaldo usando la ruta completa a pg_dump
"%PG_BIN%\pg_dump.exe" -h %PGHOST% -U %PGUSER% -d %PGDATABASE% -f "%backup_dir%\isma.dump"
if errorlevel 1 (
    echo Error al realizar el respaldo de la base de datos
    endlocal
    exit /b 1
)

REM Esperar un poco para asegurarse de que los archivos se han escrito
timeout /t 5 >nul

echo Respaldo completado en: %backup_dir%\isma.dump
endlocal
pause
