SHELL=/bin/bash
PYTHON=python3
NODE=node
SERVERMOD=http.server
BABEL=babel

SRC_JS=$(shell find ./js -not -path '*/vendor/*' -name '*.js' -and -not -name 'bootstrap.js')
SRC_SASS=./sass/main.scss
SRC_ASSETS=./assets
WATCH_FILES=$(SRC_JS) ./js/bootstrap.js ./sass $(SRC_ASSETS) index.html Makefile package.json bower.json
BUILDDIR=./build

BUILDTYPE='development'

.PHONY: all test clean serve watch

all: $(BUILDDIR)/js/bundle.js $(BUILDDIR)/css/bundle.css $(BUILDDIR)/assets $(BUILDDIR)/index.html

test:
	@./test.sh

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
	@cp -f ./index.html $@

$(BUILDDIR)/js: $(BUILDDIR)
	@if [ ! -d $@ ]; then mkdir $@; fi

$(BUILDDIR)/js/bootstrap.js: $(BUILDDIR)/js
	@cp -f ./js/bootstrap.js $@

$(BUILDDIR)/js/vendor: $(BUILDDIR)/js
	@cp -r ./js/vendor $@

$(BUILDDIR)/js/bundle.js: $(BUILDDIR)/js $(BUILDDIR)/js/bootstrap.js $(BUILDDIR)/js/vendor
	eslint $(SRC_JS)
	babel -m ignore $(SRC_JS) > $@

$(BUILDDIR)/css/bundle.css: $(BUILDDIR)
	@if [ ! -d $(BUILDDIR)/css ]; then mkdir $(BUILDDIR)/css; fi
	sass $(SRC_SASS) > $@

$(BUILDDIR)/assets: $(BUILDDIR)
	@case $(BUILDTYPE) in\
		'development')\
			if [ ! -L $@ ]; then ln -s ../assets $@; fi\
			;;\
		'production')\
			cp -r ../assets $@\
			;;\
	esac
