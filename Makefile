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

YAS_DIR := $(firstword $(wildcard elpa/yasnippet-*))
YAS_SUBDIRS = $(wildcard snippets/*)
YAS_COMPILED = $(YAS_SUBDIRS:%=%/.yas-compiled-snippets.el)

all: init.elc

ifneq (,$(wildcard vendor/$(ORG_PKGNAME)/lisp))
all: doc
endif

ifneq (,$(YAS_DIR))
all: $(YAS_COMPILED)
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

$(YAS_COMPILED):
	$(BATCH) -L $(YAS_DIR) -l yasnippet -eval "(let ((yas-snippet-dirs (list \"snippets\"))) (yas-recompile-all))"

snippets: snippets-clean $(YAS_COMPILED)

snippets-clean:
	rm -f $(YAS_COMPILED)

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

EMACS_RAILS_LIBS := -L vendor/emacs-rails -l cl -l vendor/emacs-rails/inflections.el -l vendor/emacs-rails/rails-lib.el -l vendor/emacs-rails/rails-refactoring.el -l vendor/emacs-rails/rails-project.el
EMACS_RAILS_IGNORE := vendor/emacs-rails/behave-rails.el

vendor/emacs-rails/rails.elc: vendor/emacs-rails/rails.el
	$(BATCH) $(EMACS_RAILS_LIBS) -f batch-byte-compile \
		$(filter-out $(EMACS_RAILS_IGNORE),$(wildcard vendor/emacs-rails/*.el))

vendor/git-emacs/git-emacs.el vendor/emacs-rails/rails.el:
	git submodule init
	git submodule update

verify: init.elc
	$(EMACS) --debug-init -q -eval "(setq module-black-list '(server))" -l ./init.elc -f module-initialize

cartonize: init.elc
	$(BATCH) -l ./init.elc -l pallet -f pallet-repack

cartonize-update: init.elc
	$(BATCH) -l ./init.elc -l pallet -f pallet-repack

elpa: init.elc
	$(BATCH) -l ./init.elc -l dash -f module-initialize

elpa-update: init.elc
	CARTON_PROJECT_PATH=$(pwd) CARTON_COMMAND="update" $(BATCH) -l ./init.elc -l dash -l carton -f module-initialize -f carton-handle-commandline

site-lisp-update:
	curl -k -L -o site-lisp/alternative-files.el https://github.com/doitian/alternative-files-el/raw/master/alternative-files.el
	curl -k -L -o site-lisp/carton.el https://github.com/rejeep/carton/raw/master/carton.el
	curl -k -L -o site-lisp/dash.el https://github.com/magnars/dash.el/raw/master/dash.el
	curl -k -L -o site-lisp/dtrt-indent.el http://git.savannah.gnu.org/gitweb/\?p\=dtrt-indent.git\;a\=blob_plain\;f\=dtrt-indent.el\;hb\=HEAD
	curl -k -L -o site-lisp/hide-comnt.el http://www.emacswiki.org/emacs-en/download/hide-comnt.el
	curl -k -L -o site-lisp/inf-ruby.el https://raw.github.com/nonsequitur/inf-ruby/master/inf-ruby.el
	curl -k -L -o site-lisp/notify.el http://www.emacswiki.org/emacs/download/notify.el
	curl -k -L https://raw.github.com/rdallasgray/pallet/master/src/pallet.el | sed 's/^@COMMENTARY//' > site-lisp/pallet.el
	curl -k -L -o site-lisp/pick-backup.el https://raw.github.com/emacsmirror/pick-backup/master/pick-backup.el
	curl -k -L -o site-lisp/sequential-command.el http://www.emacswiki.org/emacs/download/sequential-command.el
	curl -k -L -o site-lisp/thing-actions.el https://github.com/doitian/thing-actions.el/raw/master/thing-actions.el
	curl -k -L -o "site-lisp/thingatpt+.el" http://www.emacswiki.org/emacs-en/download/thingatpt%2b.el
	curl -k -L -o site-lisp/thing-cmds.el http://www.emacswiki.org/emacs-en/download/thing-cmds.el
	curl -k -L -o site-lisp/winring.el https://launchpadlibrarian.net/43687812/winring.el
	$(MAKE)

update: elpa-update site-lisp-update

.PHONY: all doc verify clean vendor vendor-clean org git-emacs emacs-rails
.PHONY: org-cleanup git-emacs-cleanup emacs-rails-cleanup
.PHONY: snippets snippets-clean
.PHONY: cartonize
.PHONY: elpa elpa-update site-lisp-update update
