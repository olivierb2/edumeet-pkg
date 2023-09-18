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
	mkdir -p $(DESTDIR)/usr/share/${PROJECT}/config
	ln -sf /etc/edumeet/config.js $(DESTDIR)/usr/share/${PROJECT}/config/config.js
	ln -sf /etc/edumeet/config.yaml $(DESTDIR)/usr/share/${PROJECT}/config/config.yaml
	mkdir -p $(DESTDIR)/etc/edumeet/
	cp server/config/config.example.js $(DESTDIR)/etc/edumeet/config.js
	cp server/config/config.example.yaml $(DESTDIR)/etc/edumeet/config.yaml
	cp server/dist/public/config/config.example.js $(DESTDIR)/etc/edumeet/frontend.js
	mkdir -p $(DESTDIR)/usr/share/${PROJECT}/public/config/
	ln -sf /etc/edumeet/frontend.js $(DESTDIR)/usr/share/${PROJECT}/public/config/config.js

clean:
	rm -rf prom.md README.md LICENSE.md edumeet.service CONTRIBUTING.md CHANGELOG.md server repository munin LTI docs compose app
