oOSTYPE := $(shell echo $$OSTYPE)
ifeq (,$(findstring darwin,$(OSTYPE)))
  EMACS := emacs
else
  EMACS := /Applications/Emacs.app/Contents/MacOS/Emacs
endif

BATCH := $(EMACS) -batch -q -no-site-file -L site-lisp
# -eval "(setq max-specpdl-size 2000 max-lisp-eval-depth 1000)"

ELC := $(BATCH) -f batch-byte-compile

SITE_ELFILES := $(filter-out site-lisp/my-loaddefs.el,$(wildcard site-lisp/*.el))
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
	$(BATCH) -L vendor/$(ORG_PKGNAME)/lisp -l ox-md --file $< -eval \
"(defadvice org-md-headline (after anchor (headline contents info) activate) (setq ad-return-value (concat \"<a name=\\\"sec-\" (mapconcat 'number-to-string (org-export-get-headline-number headline info) \"-\") \"\\\"></a>\\n\" ad-return-value)))"\
	 -f org-md-export-to-markdown

clean:
	rm -rf init.el site-lisp/my-loaddefs.el $(ELCFILES)

vendor-clean:
	rm -rf tmp/org-* vendor/org-*

vendor: org

org: vendor/$(ORG_PKGNAME)/lisp/org-loaddefs.el

vendor/$(ORG_PKGNAME)/lisp/org-loaddefs.el: vendor/$(ORG_PKGNAME)
	cd $< && make compile

vendor/$(ORG_PKGNAME): tmp/${ORG_TARBALL}
	tar -xzf $< -C vendor

tmp/${ORG_TARBALL}:
	curl -o $@ ${ORG_DOWNLOAD_URL}

verify:
	$(EMACS) --debug-init -q -eval "(setq module-black-list '(server))" -l ./init.elc -f module-initialize

.PHONY: all doc verify clean vendor org
