#wordpress-development

A quick and easy way to setup WordPress application using Docker and docker-compose. This will setup a developement environment with PHP7-fpm, MariaDB and Nginx.

It's a customized fork of [Simettric wordpress composer installation](https://github.com/Simettric/wordpress-composer-installation) and [docker-php7](https://github.com/shameerc/docker-php7)

###Structure

~~~
├── app
│   ├─ config-prod.php.dist
│   ├─ composer.json  
│   └─ public
│       ├── index.php
│       └─ ...
├── database
├── docker-compose.yml
├── fpm
│   ├── Dockerfile
│   └── supervisord.conf
├── nginx
│   ├── Dockerfile
│   └── default.conf
~~~

- `app` is the directory for project files. Our Nginx config is pointing to `app/public`, which can be changed in `nginx/default.conf`
- `database` is where MariDB will store the database files.


##Usage
~~~
git clone git@github.com:jeslopcru/wordpress-development.git
cd wordpress-development
make up
make install
~~~

Add docker.dev on your /etc/hosts file and run

- [http://docker.dev:8080](http://docker.dev:8080) run WordPress
- [http://docker.dev:8090](http://docker.dev:8090) run phpmyadmin root/root

**Create your own configuration file:**
~~~
cp app/config-prod.php.dist app/config-dev.php
~~~
  
You need almost one of these configuration files:
  
**config-dev.php:**
 
This file must be used for dev environment.
WordPress will use it only if there is not a config-prod.php file.


### WordPress Composer Installation

Base configuration for install and deploy WordPress sites using composer

The structure inside your app/ directory for your WordPress instalation will be:

    /config-dev.php
    /config-prod.php.dist
    /vendor
    /public
    /public/_wp        -> the WordPress installation dir (managed by composer)
    /public/index.php  -> the WordPress bootstrap file
    /public/wp-content -> the WordPress wp-content directory

It uses [WordPress Packagist](https://wpackagist.org/) in order to manage your plugins, themes and other php dependencies
