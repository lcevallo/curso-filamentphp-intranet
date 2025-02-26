@echo off
set PGPASSWORD=Passw0rd
set PGUSER=postgres
set PGDATABASE=ulvr_th
set PGPORT=5432
set PGHOST=localhost

echo Deteniendo el servicio de PostgreSQL...
net stop postgresql

echo Iniciando el servicio de PostgreSQL...
net start postgresql

@REM Esto sirve para respaldar las tablas de la base de datos de la aplicación.
pg_dump -U %PGUSER% -d %PGDATABASE% -t countries -t states -t cities > respaldos/backup_countries_states_cities.dump

echo Proceso completado.
