SASS=sass

MAIN_SASS=$(shell pwd)/main.s?ss

.PHONY: all

all: $(BUILDDIR)/css/bundle.css

$(BUILDDIR)/css/bundle.css: $(MAIN_SASS)
	@if [ ! -d $(BUILDDIR)/css ]; then mkdir $(BUILDDIR)/css; fi
	sass $^ > $@
