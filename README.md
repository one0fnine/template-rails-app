# README

* Ruby 3.1.0
* Rails 7.0.1
* Bundler: 2.3.3
* Yarn: 1.22.17
* Node: 14
* Postgresql: 13
* Redis: 3.2

## Makefile
To fire up docker runner:
```bash
$ make runner
```

To copy configs:
```bash
$ make copy-configs
```

To edit dev creds:
```bash
$ make edit-dev-creds
```

To initialize app via docker:
```bash
$ make do-init-app
```

## Devise
**with JWT and JWT strategy is Allow**

Needs to generate 3 keys: `secret_key`, `pepper`, `jwt_key`
```bash
$ bundle exec rails secret
```
Needs to generate keys to encrypts `email` field in DB:
```bash
$ bundle exec rails db:encryption:init
```
