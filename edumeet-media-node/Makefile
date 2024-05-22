.DEFAULT_GOAL := build

STATIC=/usr/share
VAR=/var
PROJECT=edumeet
COMPONENT=media-node

src:
	git clone --branch main --depth 1 https://github.com/edumeet/$(PROJECT)-$(COMPONENT) sources

	## Moving files to right location
	mv sources/* ./
	rm -rf sources

node_modules:
	npx yarn install --frozen-lockfile

build: src node_modules src node_modules
	npx yarn run build

install: build

clean:
	rm -rf node_modules dist
