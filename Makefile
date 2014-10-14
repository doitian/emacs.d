OSTYPE := $(shell echo $$OSTYPE)
ifeq (,$(findstring darwin,$(OSTYPE)))
  EMACS := emacs
else
  EMACS := /Applications/Emacs.app/Contents/MacOS/Emacs
endif

BATCH := $(EMACS) -batch -q -no-site-file -L lisp
# -eval "(setq max-specpdl-size 2000 max-lisp-eval-depth 1000)"

ELC := $(BATCH) -f batch-byte-compile

ELFILES := $(filter-out lisp/my-loaddefs.el,$(wildcard lisp/*.el))
ELCFILES := $(ELFILES:%.el=%.elc)

all: init.el lisp/my-loaddefs.el $(ELCFILES)

.SUFFIXES: .el .elc

.el.elc:
	$(ELC) $<

lisp/my-loaddefs.el: $(ELFILES)
	$(BATCH) -eval "(setq generated-autoload-file (expand-file-name \"$@\"))" \
		 -f batch-update-autoloads lisp

init.el: README.org
	rm -rf custom.el
	$(BATCH) -l ob-tangle -eval "(org-babel-tangle-file \"$<\" \"$@\")"

elpa: init.el
	$(BATCH) -l ./init.el

clean:
	rm -rf init.el init.elc $(ELCFILES) lisp/my-loaddefs.el

.PHONY: all clean elpa
