# Docker
do-run:
	docker-compose run --rm --service-ports runner

do-app:
	docker-compose up rails

do-worker:
	docker-compose up sidekiq

do-dbmigrate:
	docker-compose run --rm runner make db-migrate

do-console:
	docker-compose run --rm runner make console

do-bundle:
	docker-compose run --rm runner bundle install

do-rebuild-app:
	docker-compose build --compress --force-rm --parallel --progress auto runner;
	docker-compose build --compress --force-rm --parallel --progress auto rails;
	docker-compose build --compress --force-rm --parallel --progress auto sidekiq;

# Rails
db-setup:
	bundle exec rails db:setup

db_setup: db-setup
dbsetup: db-setup

db-migrate:
	bundle exec rails db:migrate

db_migrate: db-migrate
dbmigrate: db-migrate

console:
	bundle exec rails console

test:
	bundle exec rspec

logs:
	tail -f ./log/development.log

restart:
	touch ./tmp/restart.txt
