# laravel-phonebook

A MVC skeleton on the arms of Laravel 5.4 + Passport + Auth + Hybrid Controller REST and FORM + Single database multi-tenancy

## Quick start

1 - Clone the repo:

```bash
git clone https://github.com/avlima/laravel-phonebook.git
```

2 - Change to the directory created

```bash
cd laravel-phonebook/
```

3 - Download Composer

Run this in your terminal to get the latest Composer version:

```bash
curl -sS https://getcomposer.org/installer | php
```

or if you don't have curl:

```bash
php -r "readfile('https://getcomposer.org/installer');" | php
```

4 - Composer Install

```bash
composer install
```

5 - Generate key with artisan.


Rename the file .env.axample to .env

```bash
mv .env.axample .env
```

6 - Import sql file.


Run phonebook.sql and configure .env if you want to change the path

```bash
vi .env
```
```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=phonebook
DB_USERNAME=root
DB_PASSWORD=secret
```

7 - Install passport:

```bash
php artisan passport:install
```

8 - Start server:

```bash
php artisan serve
```

or

```bash
php -S 0.0.0.0:8000 -t public/
```

9 - Collection Link (Import to Postman)

```bash
https://www.getpostman.com/collections/f51a3b19cfe42ec56c6d
```

## Contributing

If you find an issue, or have a better way to do something, feel free to open an issue or a pull request.

##Copyright and license

Code and documentation copyright (c) 2017, Code released under the New BSD license.