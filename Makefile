OSTYPE := $(shell echo $$OSTYPE)
ifeq (,$(findstring darwin,$(OSTYPE)))
  EMACS := emacs
else
  EMACS := /Applications/Emacs.app/Contents/MacOS/Emacs
endif

BATCH := $(EMACS) -batch -q -no-site-file -L site-lisp
# -eval "(setq max-specpdl-size 2000 max-lisp-eval-depth 1000)"

ELC := $(BATCH) -f batch-byte-compile

SITE_ELFILES := $(filter-out site-lisp/readme-md-export.el site-lisp/my-loaddefs.el,$(wildcard site-lisp/*.el))
SITE_ELCFILES := $(SITE_ELFILES:%.el=%.elc)

ELFILES := init.el site-lisp/my-loaddefs.el $(SITE_ELFILES)
ELCFILES := init.elc $(SITE_ELCFILES)

ORG_VERSION := 8.0.1
ORG_PKGNAME := org-$(ORG_VERSION)
ORG_TARBALL := $(ORG_PKGNAME).tar.gz
ORG_DOWNLOAD_URL := http://orgmode.org/$(ORG_TARBALL)
ORG_INSTALLED := 

all: init.elc

ifneq (,$(wildcard vendor/$(ORG_PKGNAME)/lisp))
all: doc
endif

.SUFFIXES: .el .elc

.el.elc:
	$(ELC) $<

init.elc: site-lisp/my-loaddefs.el $(SITE_ELCFILES)

site-lisp/my-loaddefs.el: $(SITE_ELFILES)
	$(BATCH) -eval "(setq generated-autoload-file (expand-file-name \"$@\"))" \
		 -f batch-update-autoloads site-lisp

init.el: README.org
	$(BATCH) -l ob-tangle -eval "(org-babel-tangle-file \"$<\" \"$@\")"

doc: README.md

README.md: README.org
	$(BATCH) -L vendor/$(ORG_PKGNAME)/lisp -l ox-md --file $< -l site-lisp/readme-md-export.el -f org-md-export-to-markdown

clean:
	rm -rf init.el site-lisp/my-loaddefs.el $(ELCFILES)

vendor-clean: org-clean git-emacs-clean emacs-rails-clean

vendor: org git-emacs emacs-rails

org: vendor/$(ORG_PKGNAME)/lisp/org-loaddefs.el

org-clean:
	rm -rf tmp/org-* vendor/org-*

vendor/$(ORG_PKGNAME)/lisp/org-loaddefs.el: vendor/$(ORG_PKGNAME)
	cd $< && make compile

vendor/$(ORG_PKGNAME): tmp/${ORG_TARBALL}
	tar -xzf $< -C vendor

tmp/${ORG_TARBALL}:
	curl -o $@ ${ORG_DOWNLOAD_URL}

git-emacs: vendor/git-emacs/git-emacs.elc

git-emacs-clean:
	rm -f vendor/git-emacs/*.elc

vendor/git-emacs/git-emacs.elc: vendor/git-emacs/git-emacs.el
	cd vendor/git-emacs && make

emacs-rails: vendor/emacs-rails/rails.elc

emacs-rails-clean:
	rm -f vendor/emacs-rails/*.elc

EMACS_RAILS_LIBS := -L vendor/emacs-rails -l cl -l vendor/emacs-rails/inflections.el -l vendor/emacs-rails/rails-lib.el -l vendor/emacs-rails/rails-refactoring.el
EMACS_RAILS_IGNORE := vendor/emacs-rails/behave-rails.el

vendor/emacs-rails/rails.elc: vendor/emacs-rails/rails.el
	$(BATCH) $(EMACS_RAILS_LIBS) -f batch-byte-compile \
		$(filter-out $(EMACS_RAILS_IGNORE),$(wildcard vendor/emacs-rails/*.el))

vendor/git-emacs/git-emacs.el vendor/emacs-rails/rails.el:
	git submodule init
	git submodule update

verify:
	$(EMACS) --debug-init -q -eval "(setq module-black-list '(server))" -l ./init.elc -f module-initialize

.PHONY: all doc verify clean vendor vendor-clean org git-emacs emacs-rails org-cleanup git-emacs-cleanup emacs-rails-cleanup
