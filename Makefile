SUBDIRS := edumeet-media-node edumeet-room-server edumeet-client

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

install:

clean:
	rm -rf edumeet-media-node/sources edumeet-room-server/sources edumeet-client/sources