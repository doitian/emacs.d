OSTYPE := $(shell echo $$OSTYPE)
ifeq (,$(findstring darwin,$(OSTYPE)))
  EMACS := emacs
else
  EMACS := /Applications/Emacs.app/Contents/MacOS/Emacs
endif

BATCH := $(EMACS) -batch -q -no-site-file -L lisp
# -eval "(setq max-specpdl-size 2000 max-lisp-eval-depth 1000)"

ELC := $(BATCH) -f batch-byte-compile

all: init.el

.SUFFIXES: .el .elc

.el.elc:
	$(ELC) $<

init.el: README.org
	$(BATCH) -l ob-tangle -eval "(org-babel-tangle-file \"$<\" \"$@\")"

clean:
	rm -rf init.el init.elc

.PHONY: all clean
