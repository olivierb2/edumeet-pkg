STATIC=/usr/share
VAR=/var
PROJECT=edumeet
VERSION := $(shell head -n 1 debian/changelog | cut -d\( -f2 | cut -d\) -f1)

all: server/dist

server/dist:
	## Disable until merge is done
	git clone --branch ${VERSION} --depth 1 https://github.com/edumeet/edumeet repository
	#git clone --branch master --depth 1 https://github.com/iabsis/edumeet repository

	## Moving files to right location
	mv repository/* ./
	rm -rf repository
	cd app ; npx yarn ; npx yarn build
	cd server ; npx yarn ; npx yarn build

install: server/dist

clean:
	rm -rf prom.md README.md LICENSE.md edumeet.service CONTRIBUTING.md CHANGELOG.md server repository munin LTI docs compose app
