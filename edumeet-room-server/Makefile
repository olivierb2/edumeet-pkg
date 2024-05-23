.DEFAULT_GOAL := build

STATIC=/usr/share
VAR=/var
ETC=/etc
PROJECT=edumeet
COMPONENT=room-server

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
	cp sources/config/config.example.json $(DESTDIR)$(ETC)/$(PROJECT)/$(COMPONENT).json
	mkdir -p $(DESTDIR)$(STATIC)/$(PROJECT)/$(COMPONENT)/config
	ln -sf $(ETC)/$(PROJECT)/$(COMPONENT).json $(DESTDIR)$(STATIC)/$(PROJECT)/$(COMPONENT)/config/config.json

clean:
	rm -rf sources
