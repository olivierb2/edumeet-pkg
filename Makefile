subdirs = edumeet-media-node edumeet-room-server edumeet-client

.PHONY: $(subdirs)

install: $(subdirs)
clean: $(subdirs)

$(subdirs):
	make -C $@ $(MAKECMDGOALS)

