SHELL=/bin/bash
PYTHON=python3
NODE=node
SERVERMOD=http.server
ROOT=$(shell pwd)
NPM_BIN=$(ROOT)/node_modules/.bin
BROWSERIFY=$(NPM_BIN)/browserify
ESLINT=$(NPM_BIN)/eslint

SRC_JS=$(shell find ./js -not -path '*/vendor/*' -name '*.js' -and -not -name 'bootstrap.js')
MAIN_JS=$(ROOT)/js/main.js
SRC_SASS=$(ROOT)/sass/main.scss
SRC_ASSETS=$(ROOT)/assets
WATCH_FILES=$(SRC_JS) $(ROOT)/sass $(SRC_ASSETS) index.html Makefile package.json bower.json
BUILDDIR=$(ROOT)/build

BUILDTYPE='development'

.PHONY: all test clean serve watch

all: $(BUILDDIR)/js/bundle.js\
	$(BUILDDIR)/css/bundle.css\
	$(BUILDDIR)/assets\
	$(BUILDDIR)/assets/monokai.css\
	$(BUILDDIR)/assets/codemirror.css\
	$(BUILDDIR)/templates\
	$(BUILDDIR)/index.html

test:
	@$(ROOT)/test.sh

clean:
	rm -r $(BUILDDIR)

serve: all
	@cd build
	@$(PYTHON) -m $(SERVERMOD)

watch: all
	@while inotifywait -q -r -e create,close_write,move,delete,delete_self $(WATCH_FILES); do \
			make clean;\
			make all;\
			echo; \
		done

$(BUILDDIR):
	@mkdir $@

$(BUILDDIR)/index.html: $(BUILDDIR)
	@cp -f $(ROOT)/index.html $@

$(BUILDDIR)/js: $(BUILDDIR)
	@if [ ! -d $@ ]; then mkdir $@; fi

$(BUILDDIR)/js/vendor: $(BUILDDIR)/js
	@cp -rf $(ROOT)/js/vendor $@

$(BUILDDIR)/js/bundle.js: $(BUILDDIR)/js $(BUILDDIR)/js/vendor
	$(ESLINT) $(SRC_JS)
	$(BROWSERIFY) -d -e $(MAIN_JS) -t babelify -o $@

$(BUILDDIR)/css/bundle.css: $(ROOT)/sass
	cd sass && make all BUILDDIR=$(BUILDDIR) ROOT=$(ROOT)

$(BUILDDIR)/templates: $(ROOT)/templates
	cd templates && make all BUILDDIR=$(BUILDDIR) ROOT=$(ROOT) NPM_BIN=$(NPM_BIN)

$(BUILDDIR)/assets: $(BUILDDIR)
	@if [ ! -d $@ ]; then mkdir $@; fi

$(BUILDDIR)/assets/%.css: $(ROOT)/assets/%.css $(BUILDDIR)/assets
	cp -f $^

$(BUILDDIR)/assets/images: $(BUILDDIR)/assets
	@case $(BUILDTYPE) in\
		'development')\
			if [ ! -L $@ ]; then ln -s ../assets/images $@; fi\
			;;\
		'production')\
			cp -r ../assets/images $@\
			;;\
	esac
