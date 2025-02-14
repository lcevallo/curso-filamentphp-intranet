# CURSO FILAMENT DE CERO A EXPERTO


## BluePrint

composer require -W --dev laravel-shift/blueprint
composer require filament/filament:"^3.2" -W
php artisan filament:install --panels
php artisan make:filament-user



### SQL para crear base

-- Termina todas las conexiones activas a la base de datos ulvr_th

`
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'isma'
AND pid <> pg_backend_pid();
`

-- Elimina la base de datos isma si existe


`
DROP DATABASE IF EXISTS isma;
`

-- Crea la base de datos isma con codificación UTF-8

`
CREATE DATABASE isma ENCODING 'utf-8';
`

https://github.com/altwaireb/laravel-world

composer require altwaireb/laravel-world
php artisan world:install

php -d memory_limit=550M artisan world:seeder


php artisan make:filament-resource Country --generate


Shift + Alt + Up/Down  Duplicate lines in vs code
Alt + Up/Down Move lines 


php artisan make:migration add_address_fields_to_users_table
La nomenclatura to_users_table colocara la tabla users


[blade-ui-kit.com/blade-icons/blade-icons](https://blade-ui-kit.com/blade-icons)

php artisan make:model Calendar -m
php artisan make:model Department -m
php artisan make:model Timesheet -m
php artisan make:model Holiday -m


Las tablas pivotes que no necesitan un modelo para trabajar sobre ellas tendran relaciones entre dos tablas

php artisan make:migration create_table_user_calendar    
Un usuario va a tener muchos calendarios y un calendario va a tener muchos estudiantes
php artisan make:migration create_table_user_departament
Un usuario puede pertenecer departamentos y un departamento puede contener a  muchos estudiantes


php artisan make:filament-resource Calendar --generate
php artisan make:filament-resource Timesheets --generate
php artisan make:filament-resource Holiday --generate
php artisan make:filament-resource Department


php artisan make:filament-widget StatsOverview --stats-overview

php artisan make:filament-widget UserChart --chart


Aqui procede a hacer el nuevo panel
php artisan make:filament-panel 


php artisan make:filament-widget PersonalWidgetStats

Me quede en el min 32 del video 8
