.DEFAULT_GOAL := build

STATIC=/usr/share
VAR=/var
PROJECT=edumeet
COMPONENT=media-node

sources:
	git clone --branch main --depth 1 https://github.com/edumeet/$(PROJECT)-$(COMPONENT) sources

node_modules:
	cd sources ; npx yarn install --frozen-lockfile

build: sources node_modules
	cd sources ; npx yarn run build

install: build

clean:
	rm -rf sources
