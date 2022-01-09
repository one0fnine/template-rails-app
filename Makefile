runner:
	docker-compose run --rm --service-ports runner

copy-configs:
	cp config/storage.yml.example config/storage.yml
	cp config/database.yml.example config/database.yml
	cp config/cable.yml.example config/cable.yml
	cp config/credentials/development.yml.example config/credentials/development.yml
	cp config/credentials/test.yml.example config/credentials/test.yml

do-init-app:
	make copy-configs
	docker-compose run --rm runner bundle install
