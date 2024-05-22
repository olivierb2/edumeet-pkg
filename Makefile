SUBDIRS := edumeet-media-node edumeet-room-server edumeet-client

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
