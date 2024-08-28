# CURSO DE CERO A EXPERTO EN FILAMENTPHP
composer create-project laravel/laravel filamentphp

composer require filament/filament:"^3.2" -W

php artisan filament:install --panels

php artisan make:filament-user




git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/lcevallo/curso-filamentphp-intranet.git
git push -u origin main

primero crear el archivo .env
copiar el contenido del archivo .env.example
composer install como el npm install
Crear la base de datos
php artisan key:generate
php artisan migrate



php artisan migrate:fresh --seed


composer require altwaireb/laravel-world

php -d memory_limit=1G artisan world:seeder


php artisan make:filament-resource Country --generate
php artisan make:filament-resource State --generate
php artisan make:filament-resource City --generate


php artisan make:migration add_address_fields_to_users_table

php artisan make:migration create_table_user_calendar
php artisan make:migration create_table_user_departament


php artisan migrate

php artisan make:filament-resource Calendar --generate
php artisan make:filament-resource Departament
php artisan make:filament-resource Timesheet --generate
