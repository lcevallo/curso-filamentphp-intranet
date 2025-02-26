# CURSO FILAMENT DE CERO A EXPERTO


## BluePrint

composer require -W --dev laravel-shift/blueprint
composer require filament/filament:"^3.2" -W
php artisan filament:install --panels
php artisan make:filament-user


## Installation

To set up the schoolMIS application, follow these steps:

1. Clone the repository: `git clone https://github.com/lcevallo/curso-filamentphp-intranet.git`
2. Configure environment variables: Run `cd ulvr-th && cp .env.example .env` ,
3. Install composer: `composer install`
4. Install npm: `npm install`
5. Generate application key: `php artisan key:generate`
6. Run migrations: `php artisan migrate` (This command sets up the database tables based on defined migrations) or `php artisan migrate:rollback`
7. (Optional) Seed the database: `php artisan db:seed` (This command populates the database with sample data, if available)
8. Run Application `php artisan serve`,
9. Link Storage `php artisan storage:link`
10. Link Storage `npm run build`
11. Run vite command `npm run build`
12. Change in prod `APP_URL=http://curso-filamentphp-intranet.test`
13. Change in prod `DB_DATABASE=isma`
14. sudo chown -R www-data:www-data \*
15. sudo chown -R administrador:administrador /var/www/html/curso-filamentphp-intranet

### SQL para crear base

-- Termina todas las conexiones activas a la base de datos isma

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

php artisan make:mail HolidayPending
php artisan make:mail HolidayApproved
php artisan make:mail HolidayDecline
php artisan make:command TestEmails

php artisan make:notifications-table
