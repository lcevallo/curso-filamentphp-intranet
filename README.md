# CURSO DE CERO A EXPERTO EN FILAMENTPHP
composer create-project laravel/laravel filamentphp

composer require filament/filament:"^3.2" -W

php artisan filament:install --panels

php artisan make:filament-user



echo "# curso-filamentphp-intranet" >> README.md
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
