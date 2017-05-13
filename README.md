# laravel-phonebook

A MVC skeleton on the arms of Laravel 5 + AngularJS + AngularUI Router + AdminLTE 2

This skeleton use Composer, Laravel 5, AngularJS, AngularUI Router, AdminLTE 2 and jQuery

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

9 - Generate key with artisan.


Rename the file .env.axample to .env

```bash
mv .env.axample .env
```

and

```bash
php artisan key:generate
```

10 - Start PHP Built-in web server:

```bash
php -S 127.0.0.1:8000 -t public/
```

or

```bash
php -S 0.0.0.0:8000 -t public/
```

##Copyright and license

Code and documentation copyright (c) 2015, Code released under the New BSD license.