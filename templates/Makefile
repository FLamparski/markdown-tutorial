RIOT=$(NPM_BIN)/riot

.PHONY: all

TEMPLATES=$(ROOT)/templates

all: $(BUILDDIR)/templates

$(BUILDDIR)/templates: $(TEMPLATES)
	$(RIOT) -c -t es6 $< $@
