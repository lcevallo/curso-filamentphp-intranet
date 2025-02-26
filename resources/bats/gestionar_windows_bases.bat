@echo off
set PGPASSWORD=Passw0rd
set PGUSER=postgres
set PGDATABASE=postgres
set PGPORT=5432
set PGHOST=localhost

echo Deteniendo el servicio de PostgreSQL...
net stop postgresql

echo Iniciando el servicio de PostgreSQL...
net start postgresql

echo Borrando las bases de datos...
psql -U %PGUSER% -d %PGDATABASE% -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'archivos' AND pid <> pg_backend_pid();"
psql -U %PGUSER% -d %PGDATABASE% -c "DROP DATABASE IF EXISTS archivos;"
psql -U %PGUSER% -d %PGDATABASE% -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'docelectronicos' AND pid <> pg_backend_pid();"
psql -U %PGUSER% -d %PGDATABASE% -c "DROP DATABASE IF EXISTS docelectronicos;"
psql -U %PGUSER% -d %PGDATABASE% -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'imagenes' AND pid <> pg_backend_pid();"
psql -U %PGUSER% -d %PGDATABASE% -c "DROP DATABASE IF EXISTS imagenes;"
psql -U %PGUSER% -d %PGDATABASE% -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'maestros' AND pid <> pg_backend_pid();"
psql -U %PGUSER% -d %PGDATABASE% -c "DROP DATABASE IF EXISTS maestros;"
psql -U %PGUSER% -d %PGDATABASE% -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'transacciones' AND pid <> pg_backend_pid();"
psql -U %PGUSER% -d %PGDATABASE% -c "DROP DATABASE IF EXISTS transacciones;"

echo Creando las bases de datos...
psql -U %PGUSER% -d %PGDATABASE% -c "CREATE DATABASE archivos WITH ENCODING='UTF8';"
psql -U %PGUSER% -d %PGDATABASE% -c "CREATE DATABASE docelectronicos WITH ENCODING='UTF8';"
psql -U %PGUSER% -d %PGDATABASE% -c "CREATE DATABASE imagenes WITH ENCODING='UTF8';"
psql -U %PGUSER% -d %PGDATABASE% -c "CREATE DATABASE maestros WITH ENCODING='UTF8';"
psql -U %PGUSER% -d %PGDATABASE% -c "CREATE DATABASE transacciones WITH ENCODING='UTF8';"

echo Restaurando las bases de datos...
psql -U %PGUSER% -d archivos -1 -f respaldos/archivos.dump
psql -U %PGUSER% -d docelectronicos -1 -f respaldos/docelectronicos.dump
psql -U %PGUSER% -d imagenes -1 -f respaldos/imagenes.dump
psql -U %PGUSER% -d maestros -1 -f respaldos/maestros.dump
psql -U %PGUSER% -d transacciones -1 -f respaldos/transacciones.dump

echo Proceso completado.