runner:
	docker-compose run --rm --service-ports runner

do-init-app:
	docker-compose run --rm runner bundle install
