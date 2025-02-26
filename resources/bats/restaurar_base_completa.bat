@echo off
setlocal EnableDelayedExpansion

:: Cambiar al directorio donde se encuentra el script
pushd %~dp0

:: Mostrar el directorio actual
echo Directorio actual: %cd%

:: Credenciales de PostgreSQL
set PGPASSWORD=Passw0rd
set PGUSER=postgres
set PGDATABASE=isma
set PGPORT=5432
set PGHOST=localhost
::set PGHOST=10.2.0.86
set PGBIN=C:\Program Files\PostgreSQL\16\bin

:: Directorio de respaldos
set DIRECTORIO_RESPALDOS=..\dumps

:: Lista de bases de datos
set BASES_DE_DATOS=isma

:: Restaurar cada base de datos desde su archivo de respaldo
for %%d in (%BASES_DE_DATOS%) do (
    :: Construir el nombre del archivo de respaldo
    set ARCHIVO_RESPALDO=!DIRECTORIO_RESPALDOS!\%%d.dump

    :: Mostrar el valor de ARCHIVO_RESPALDO
    echo  !ARCHIVO_RESPALDO!

    :: Verificar si el archivo de respaldo existe
    if exist "!ARCHIVO_RESPALDO!" (
        echo Restaurando la base de datos %%d desde el respaldo...
        "%PGBIN%\psql" -U %PGUSER% -d %%d -1 -f "!ARCHIVO_RESPALDO!"
    ) else (
        echo No se encontró el archivo de respaldo para la base de datos %%d.
    )
)

echo Proceso completado.

popd
endlocal
