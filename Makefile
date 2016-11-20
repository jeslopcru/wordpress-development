help: ## Prints this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

up: ## Builds the docker containers and installs dependencies
	docker-compose up -d

up-log: ## Builds the docker containers and installs dependencies
	docker-compose up

stop: ## stops the docker containers
	docker-compose stop

down: ## destroy all container
	docker-compose down

install: ## run composer install
	docker exec wordpressdevelopment_fpm_1 php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	docker exec wordpressdevelopment_fpm_1 php composer-setup.php
	docker exec wordpressdevelopment_fpm_1 php -r "unlink('composer-setup.php');"
	docker exec wordpressdevelopment_fpm_1 php composer.phar install	

update: ## run composer update
	docker exec wordpressdevelopment_fpm_1 php composer.phar update



