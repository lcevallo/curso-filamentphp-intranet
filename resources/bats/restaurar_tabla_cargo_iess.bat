@echo off
set PGPASSWORD=Passw0rd
set PGUSER=postgres
set PGDATABASE=ulvr_th
set PGPORT=5432
set PGHOST=localhost
set PGBIN=C:\Program Files\PostgreSQL\16\bin


echo Deteniendo el servicio de PostgreSQL...
net stop postgresql

echo Iniciando el servicio de PostgreSQL...
net start postgresql


@REM @REM Eliminar las tablas antes de la restauración
@REM echo Eliminando las tablas countries, states y cities...
@REM psql -U %PGUSER% -d %PGDATABASE% -c "DROP TABLE IF EXISTS countries CASCADE;"
@REM psql -U %PGUSER% -d %PGDATABASE% -c "DROP TABLE IF EXISTS states CASCADE;"
@REM psql -U %PGUSER% -d %PGDATABASE% -c "DROP TABLE IF EXISTS cities CASCADE;"

@REM @REM Restaurar las tablas desde el archivo de respaldo
@REM echo Restaurando las tablas desde el respaldo...
@REM psql -U %PGUSER% -d %PGDATABASE% -1 -f backup_countries_states_cities.dump



@REM Eliminar las tablas antes de la restauración
echo Eliminando las tablas countries, states y cities...
"%PGBIN%\psql" -U %PGUSER% -d %PGDATABASE% -c "DROP TABLE IF EXISTS cargo_iesses CASCADE;"

@REM Restaurar las tablas desde el archivo de respaldo
echo Restaurando las tablas desde el respaldo...
"%PGBIN%\psql" -U %PGUSER% -d %PGDATABASE% -1 -f backup_tabla_cargo_iess.dump



echo Proceso completado.
