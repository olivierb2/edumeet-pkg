.DEFAULT_GOAL := build

STATIC=/usr/share
VAR=/var
PROJECT=edumeet
COMPONENT=client

install_yarn:
	npm install -g yarn

sources:
	git clone --branch main --depth 1 https://github.com/edumeet/$(PROJECT)-$(COMPONENT) sources

sources/node_modules: install_yarn
	cd sources && npx yarn install --frozen-lockfile

sources/dist: sources sources/node_modules
	cd sources && npx yarn run build

build: sources/dist

install:
	mkdir -p $(DESTDIR)$(ETC)/$(PROJECT)/$(COMPONENT)
	# cp sources/config/config.example.js $(DESTDIR)$(ETC)/$(PROJECT)/$(COMPONENT).js
	cp ../debian/edumeet-client.conf $(DESTDIR)$(ETC)/$(PROJECT)/$(COMPONENT).js
	mkdir -p $(DESTDIR)$(STATIC)/$(PROJECT)/$(COMPONENT)/config
	ln -sf $(ETC)/$(PROJECT)/$(COMPONENT).js $(DESTDIR)$(STATIC)/$(PROJECT)/$(COMPONENT)/config/config.js

clean:
	rm -rf sources
