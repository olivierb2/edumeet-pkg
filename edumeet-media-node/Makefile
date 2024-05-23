.DEFAULT_GOAL := build

STATIC=/usr/share
VAR=/var
ETC=/etc
PROJECT=edumeet
COMPONENT=media-node

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
	mkdir -p $(DESTDIR)$(ETC)/$(PROJECT)
	cp ../debian/edumeet-media-node.conf $(DESTDIR)$(ETC)/$(PROJECT)/$(COMPONENT).conf

clean:
	rm -rf sources
