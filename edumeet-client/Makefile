.DEFAULT_GOAL := build

STATIC=/usr/share
VAR=/var
PROJECT=edumeet
COMPONENT=client

sources:
	git clone --branch main --depth 1 https://github.com/edumeet/$(PROJECT)-$(COMPONENT) sources

sources/node_modules:
	cd sources ; npx yarn install --frozen-lockfile

sources/dist: sources node_modules
	cd sources ; npx yarn run build

build: dist

install:

clean:
	rm -rf sources
