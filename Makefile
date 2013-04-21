OSTYPE := $(shell echo $$OSTYPE)
ifeq (,$(findstring darwin,$(OSTYPE)))
  EMACS := emacs
else
  EMACS := /Applications/Emacs.app/Contents/MacOS/Emacs
endif

BATCH := $(EMACS) -batch -q -no-site-file -L site-lisp
# -eval "(setq max-specpdl-size 2000 max-lisp-eval-depth 1000)"

ELC := $(BATCH) -f batch-byte-compile

SITE_ELFILES := $(filter-out site-lisp/my-autoloads.el,$(wildcard site-lisp/*.el))
SITE_ELCFILES := $(SITE_ELFILES:%.el=%.elc)

ELFILES := init.el site-lisp/my-autoloads.el $(SITE_ELFILES)
ELCFILES := init.elc $(SITE_ELCFILES)

all: init.elc

.SUFFIXES: .el .elc

.el.elc:
	$(ELC) $<

init.elc: site-lisp/my-autoloads.el $(SITE_ELCFILES)

site-lisp/my-autoloads.el: $(SITE_ELFILES)
	$(BATCH) -eval "(setq generated-autoload-file (expand-file-name \"$@\"))" \
		 -f batch-update-autoloads site-lisp

init.el: README.org
	$(BATCH) -l org -eval "(org-babel-tangle-file \"$<\" \"$@\")"

clean:
	rm -rf init.el site-lisp/my-autoloads.el $(ELCFILES)

.PHONY: all clean
