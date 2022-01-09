runner:
	docker-compose run --rm --service-ports runner

copy-configs:
	cp config/storage.yml.example config/storage.yml
	cp config/database.yml.example config/database.yml
	cp config/cable.yml.example config/cable.yml
	cp config/credentials/development.key.example config/credentials/development.key
	cp config/credentials/test.key.example config/credentials/test.key

edit-dev-creds:
	bundle exec rails credentials:edit --environment development

do-init-app:
	make copy-configs
	docker-compose run --rm runner bundle install && bundle exec rails db:setup
