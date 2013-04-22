;;; my-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (case-dwim-capitalize case-dwim-upcase case-dwim-downcase
;;;;;;  case-dwim-isearch-underscore case-dwim-isearch-dash case-dwim-underscore
;;;;;;  case-dwim-dash) "case-dwim" "case-dwim.el" (20852 61410 136481
;;;;;;  398000))
;;; Generated autoloads from case-dwim.el

(autoload 'case-dwim-dash "case-dwim" "\
Negative arg activate backward downcase, repeat to downcase more words bacward.
When region is action, downcase the region.
When last command is case transformation, continue case transformation.
Otherwise insert dash.

\(fn ARG)" t nil)

(autoload 'case-dwim-underscore "case-dwim" "\
Negative arg activate backward upcase, repeat to upcase more words bacward.
When region is action, upcase the region.
When last command is case transformation, continue case transformation.
Otherwise insert undersocre.

\(fn ARG)" t nil)

(autoload 'case-dwim-isearch-dash "case-dwim" "\


\(fn)" t nil)

(autoload 'case-dwim-isearch-underscore "case-dwim" "\


\(fn)" t nil)

(autoload 'case-dwim-downcase "case-dwim" "\
Negative arg activate backward downcase, repeat to downcase more words bacward.
When region is action, downcase the region.
Otherwise downcase following words.

\(fn ARG)" t nil)

(autoload 'case-dwim-upcase "case-dwim" "\
Negative arg activate backward upcase, repeat to upcase more words bacward.
When region is action, upcase the region.
Otherwise upcase following words.

\(fn ARG)" t nil)

(autoload 'case-dwim-capitalize "case-dwim" "\
Negative arg activate backward capitalize, repeat to capitalize more words bacward.
When region is action, capitalize the region.
Otherwise capitalize following words.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (hide/show-comments ignore-comments-flag) "hide-comnt"
;;;;;;  "hide-comnt.el" (20702 3844 0 0))
;;; Generated autoloads from hide-comnt.el

(defvar ignore-comments-flag t "\
Non-nil means macro `with-comments-hidden' hides comments.")

(custom-autoload 'ignore-comments-flag "hide-comnt" t)

(autoload 'hide/show-comments "hide-comnt" "\
Hide or show comments from START to END.
Interactively, hide comments, or show them if you use a prefix arg.
Interactively, START and END default to the region limits, if active.
Otherwise, including non-interactively, they default to `point-min'
and `point-max'.

Uses `save-excursion', restoring point.

Be aware that using this command to show invisible text shows *all*
such text, regardless of how it was hidden.  IOW, it does not just
show invisible text that you previously hid using this command.

From Lisp, a HIDE/SHOW value of `hide' hides comments.  Other values
show them.

This command does nothing in Emacs versions prior to Emacs 21, because
it needs `comment-search-forward'.

\(fn &optional HIDE/SHOW START END)" t nil)

;;;***

;;;### (autoloads (module-initialize module-load) "module" "module.el"
;;;;;;  (20852 17135 153438 943000))
;;; Generated autoloads from module.el

(autoload 'module-load "module" "\
Load a module by name. Prefix argument force reload the module

\(fn NAME &optional RELOAD)" t nil)

(autoload 'module-initialize "module" "\
Load all defined modules in `module-list' except ones in `module-black-list'

\(fn &optional RELOAD)" nil nil)

;;;***

;;;### (autoloads (mf-jared/insert-file-or-buffer-name mf-insert-file-name
;;;;;;  mf-insert-date mf-insert-timestamp mf-insert-time mf-insert-user
;;;;;;  mf-find-alternative-file-with-sudo mf-xsteve-save-current-directory
;;;;;;  mf-rename-current-buffer-file mf-switch-to-previous-buffer
;;;;;;  mf-indirect-region mf-smart-kill-whole-line mf-shrink-whitespaces
;;;;;;  mf-append-line-delimter-then-next-line-and-open-it-if-not-empty
;;;;;;  mf-next-line-and-open-it-if-not-empty) "my-functions" "my-functions.el"
;;;;;;  (20852 23829 243511 805000))
;;; Generated autoloads from my-functions.el

(autoload 'mf-next-line-and-open-it-if-not-empty "my-functions" "\
Go to next line. Open it unless the line is empty

\(fn)" t nil)

(autoload 'mf-append-line-delimter-then-next-line-and-open-it-if-not-empty "my-functions" "\
Append new line delimeter at the end of current line and go to next line.
Open next line if it is not empty.

\(fn)" t nil)

(autoload 'mf-shrink-whitespaces "my-functions" "\
Remove white spaces around cursor to just one or none.
If current line does not contain non-white space chars, then remove blank lines to just one.
If current line contains non-white space chars, then shrink any whitespace char surrounding cursor to just one space.
If current line is a single space, remove that space.

Calling this command 3 times will always result in no whitespaces around cursor.

\(fn)" t nil)

(autoload 'mf-smart-kill-whole-line "my-functions" "\
A simple wrapper around `kill-whole-line' that respects indentation.

\(fn &optional ARG)" t nil)

(autoload 'mf-indirect-region "my-functions" "\
Edit the current region in another buffer.
    If the buffer-local variable `mf-indirect-mode-name' is not set, prompt
    for mode name to choose for the indirect buffer interactively.
    Otherwise, use the value of said variable as argument to a funcall.

\(fn START END)" t nil)

(autoload 'mf-switch-to-previous-buffer "my-functions" "\


\(fn)" t nil)

(autoload 'mf-rename-current-buffer-file "my-functions" "\
Renames current buffer and file it is visiting.

\(fn)" t nil)

(autoload 'mf-xsteve-save-current-directory "my-functions" "\
Save the current directory to the file ~/.emacs.d/data/pwd

\(fn)" t nil)

(autoload 'mf-find-alternative-file-with-sudo "my-functions" "\


\(fn)" t nil)

(autoload 'mf-insert-user "my-functions" "\


\(fn)" t nil)

(autoload 'mf-insert-time "my-functions" "\


\(fn)" t nil)

(autoload 'mf-insert-timestamp "my-functions" "\


\(fn)" t nil)

(autoload 'mf-insert-date "my-functions" "\


\(fn)" t nil)

(autoload 'mf-insert-file-name "my-functions" "\


\(fn)" t nil)

(autoload 'mf-jared/insert-file-or-buffer-name "my-functions" "\


\(fn &optional INITIAL)" t nil)

;;;***

;;;### (autoloads (my-minor-mode) "my-mode" "my-mode.el" (20852 62124
;;;;;;  433155 837000))
;;; Generated autoloads from my-mode.el

(defvar my-minor-mode t "\
Non-nil if My minor mode is enabled.
See the command `my-minor-mode' for a description of this minor mode.")

(custom-autoload 'my-minor-mode "my-mode" nil)

(autoload 'my-minor-mode "my-mode" "\
Define a minor mode for `my-keymap'

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (notify) "notify" "notify.el" (20852 19297 530129
;;;;;;  146000))
;;; Generated autoloads from notify.el

(autoload 'notify "notify" "\
Notify TITLE, BODY via `notify-method'.
ARGS may be amongst :timeout, :icon, :urgency, :app and :category.

\(fn TITLE BODY &rest ARGS)" nil nil)

;;;***

;;;### (autoloads (org-pomodoro-record-interuptions org-pomodoro-on-org-agenda-load
;;;;;;  org-pomodoro-on-org-load) "org-pomodoro" "org-pomodoro.el"
;;;;;;  (20852 54893 819743 808000))
;;; Generated autoloads from org-pomodoro.el

(autoload 'org-pomodoro-on-org-load "org-pomodoro" "\


\(fn)" nil nil)

(autoload 'org-pomodoro-on-org-agenda-load "org-pomodoro" "\


\(fn)" nil nil)

(autoload 'org-pomodoro-record-interuptions "org-pomodoro" "\


\(fn CHAR)" t nil)

;;;***

;;;### (autoloads (pick-backup-and-view pick-backup-and-revert pick-backup-and-diff
;;;;;;  pick-backup-and-ediff) "pick-backup" "pick-backup.el" (20852
;;;;;;  1222 783265 748000))
;;; Generated autoloads from pick-backup.el

(autoload 'pick-backup-and-ediff "pick-backup" "\
Diff FILE with one of its backups.

\(fn FILE)" t nil)

(autoload 'pick-backup-and-diff "pick-backup" "\
Run Ediff on FILE and one of its backups.

\(fn FILE SWITCHES)" t nil)

(autoload 'pick-backup-and-revert "pick-backup" "\
Replace FILE with one of its backups.

\(fn)" t nil)

(autoload 'pick-backup-and-view "pick-backup" "\
View one of FILE's backups.

\(fn)" t nil)

;;;***

;;;### (autoloads (temporary-mode-define-keys temporary-mode-start)
;;;;;;  "temporary-mode" "temporary-mode.el" (20852 62539 383160
;;;;;;  356000))
;;; Generated autoloads from temporary-mode.el

(autoload 'temporary-mode-start "temporary-mode" "\


\(fn MODE-NAME KEYMAP)" nil nil)

(autoload 'temporary-mode-define-keys "temporary-mode" "\


\(fn KEYMAP MODE-NAME &optional TEMPORARY-KEYMAP)" nil nil)

;;;***

;;;### (autoloads (thing-actions-mark-thing) "thing-actions" "thing-actions.el"
;;;;;;  (20852 22782 720167 82000))
;;; Generated autoloads from thing-actions.el

(autoload 'thing-actions-mark-thing "thing-actions" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (thgcmd-bind-keys previous-visible-thing-repeat
;;;;;;  next-visible-thing-repeat next-visible-thing previous-visible-thing
;;;;;;  mark-enclosing-sexp-backward mark-enclosing-sexp-forward
;;;;;;  mark-enclosing-sexp mark-thing cycle-thing-region thing-region)
;;;;;;  "thing-cmds" "thing-cmds.el" (20701 61917 0 0))
;;; Generated autoloads from thing-cmds.el

(autoload 'thing-region "thing-cmds" "\
Set the region around a THING near the cursor.
You are prompted for the type of thing.  Completion is available (lax).
The cursor is placed at the end of the region.  You can return it to
the original location by using `C-u C-SPC' twice.
Non-interactively, THING is a string naming a thing type.

\(fn THING)" t nil)

(defalias 'select-thing-near-point 'cycle-thing-region)

(autoload 'cycle-thing-region "thing-cmds" "\
Select a thing near point.  Successive uses select different things.
The default thing type is the first element of option `thing-types'. 
In Transient Mark mode, you can follow this with `\\[mark-thing]' to select
successive things of the same type, but to do that you must first use
`C-x C-x': `\\[cycle-thing-region] C-x C-x \\[mark-thing]'

\(fn)" t nil)

(autoload 'mark-thing "thing-cmds" "\
Set point at one end of THING and set mark ARG THINGs from point.
Put mark at the same place command `forward-'THING would move point
with the same prefix argument.

Put point at the beginning of THING, unless the prefix argument (ARG)
is negative, in which case put it at the end of THING.

THING is a symbol that names a type of thing.  Interactively, you are
prompted for it.  Completion is available (lax).

If `mark-thing' is repeated or if the mark is active (in Transient
Mark mode), then it marks the next ARG THINGs, after the ones already
marked.  The type of THING used is whatever was used the last time
`mark-thing' was called.

This region extension reusing the last type of THING happens even if
the active region is empty.  This means that you can, for instance,
just use `C-SPC' to activate an empty region and then use `mark-thing'
to select more THINGS of the last kind selected.

\(fn THING &optional ARG ALLOW-EXTEND)" t nil)

(autoload 'mark-enclosing-sexp "thing-cmds" "\
Select a sexp surrounding the current cursor position.
If the mark is active (e.g. when the command is repeated), widen the
region to a sexp that encloses it.

The starting position is added to the mark ring before doing anything
else, so you can return to it (e.g. using `C-u C-SPC').

A prefix argument determines which enclosing sexp is selected: 1 means
the immediately enclosing sexp, 2 means the sexp immediately enclosing
that one, etc.

A negative prefix argument puts point at the beginning of the region
instead of the end.

In Lisp code, point is moved to (up-list ARG), and mark is at the
other end of the sexp.

This command does not work if point is in a string or a comment.

\(fn &optional ARG ALLOW-EXTEND)" t nil)

(autoload 'mark-enclosing-sexp-forward "thing-cmds" "\
`mark-enclosing-sexp' leaving point at region end.

\(fn &optional ARG)" t nil)

(autoload 'mark-enclosing-sexp-backward "thing-cmds" "\
`mark-enclosing-sexp' leaving point at region start.

\(fn &optional ARG)" t nil)

(autoload 'previous-visible-thing "thing-cmds" "\
Same as `next-visible-thing', except it moves backward, not forward.

\(fn THING START &optional END)" t nil)

(autoload 'next-visible-thing "thing-cmds" "\
Go to the next visible THING.
Start at START.  If END is non-nil then look no farther than END.
Interactively:
 - START is point.
 - If the region is not active, END is the buffer end.  If the region
   is active, END is the region end: the greater of point and mark.

Ignores (skips) comments if `ignore-comments-flag' is non-nil.  If you
also use Icicles then you can toggle this ignoring of comments using
`C-M-;' in the minibuffer, but depending on when you do so you might
need to invoke the current command again.

If you use this command or `previous-visible-thing' successively, even
mixing the two, you are prompted for the type of THING only the first
time.  You can thus bind these two commands to simple repeatable
keys (e.g. `f11', `f12'), to navigate among things quickly.

If you do not want to sacrifice two simple repeatable keys for this,
then you can instead use commands `next-visible-thing-repeat' and
`previous-visible-thing-repeat', binding them each to a less rare key
sequence that uses a prefix key.  Command `thgcmd-bind-keys' does
this: it binds them to `C-x down' and `C-x up', so you can repeat them
separately using `C-x down down...' etc.  However, unlike bindings for
`next-visible-thing' and `previous-visible-thing', switching from one
direction to the other requires you to again enter the THING type.

Non-interactively, THING is a symbol, and optional arg BACKWARD means
go to the previous thing.

Return (THING THING-START . THING-END), with THING-START and THING-END
the bounds of THING.  Return nil if no such THING is found.

\(fn THING &optional START END BACKWARD)" t nil)

(autoload 'next-visible-thing-repeat "thing-cmds" "\
Go to and get the next visible THING.
This is a repeatable version of `next-visible-thing'.

\(fn)" t nil)

(autoload 'previous-visible-thing-repeat "thing-cmds" "\
Go to and get the previous visible THING.
This is a repeatable version of `previous-visible-thing'.

\(fn)" t nil)

(autoload 'thgcmd-bind-keys "thing-cmds" "\
Bind some keys to commands defined in `thing-cmds.el'.
NOTE concerning the visible-thing navigation keys:

`C-x down' and `C-x up' are bound here (for Emacs 21 and later) to
`next-visible-thing-repeat' and `previous-visible-thing-repeat',
respectively.  This means you can use `C-x down down down...' etc. to
move forward to successive things, and similarly for `C-x up...' and
backward.  You are asked for the thing type only the first time you
hit `down' or `up' after `C-x'.

However, you cannot mix the directions forward/backward without
inputting the thing type again.  For example, If you do `C-x down up',
the `up' does not perform thing navigation (it probably does
`previous-line', the default `up' binding) .

To change direction without getting prompted for the thing type, you
need to bind, not commands `next-visible-thing-repeat' and
`previous-visible-thing-repeat', but commands `next-visible-thing' and
`previous-visible-thing' (no `-repeat' suffix).  Bind these to simple,
repeatable keys, such as `f11' and `f12'.  Because such keys are rare
\(mostly taken already), the only bindings made here for thing
navigation are `C-x down' and `C-x up'.

\(fn &optional MSGP)" t nil)

;;;***

;;;### (autoloads (find-fn-or-var-nearest-point tap-redefine-std-fns
;;;;;;  tap-put-thing-at-point-props tap-near-point-y-distance tap-near-point-x-distance
;;;;;;  thing-at-point-plus) "thingatpt+" "thingatpt+.el" (20814
;;;;;;  27051 0 0))
;;; Generated autoloads from thingatpt+.el

(let ((loads (get 'thing-at-point-plus 'custom-loads))) (if (member '"thingatpt+" loads) nil (put 'thing-at-point-plus 'custom-loads (cons '"thingatpt+" loads))))

(defvar tap-near-point-x-distance 50 "\
*Maximum number of characters from point to search, left and right.
Used typically by functions that invoke
`tap-thing/form-nearest-point-with-bounds', and which provide default
text for minibuffer input.  Such functions can also ignore or override
this setting temporarily.")

(custom-autoload 'tap-near-point-x-distance "thingatpt+" t)

(defvar tap-near-point-y-distance 5 "\
*Maximum number of lines from point to search, up and down.
To constrain search to the same line as point, set this to zero.
Used typically by functions that invoke
`tap-thing/form-nearest-point-with-bounds', and which provide default
text for minibuffer input.  Such functions can also ignore or override
this setting temporarily.")

(custom-autoload 'tap-near-point-y-distance "thingatpt+" t)

(autoload 'tap-put-thing-at-point-props "thingatpt+" "\
Change `(bounds-of-)thing-at-point' properties for standard things.
This makes some things normally handled by `thingatpt.el' be handled
instead by functions defined in `thingatpt+.el'.

This also affects some things that are handled by `thingatpt.el' in
another way, not by setting these properties.

\(fn)" t nil)

(autoload 'tap-redefine-std-fns "thingatpt+" "\
Redefine some standard `thingatpt.el' functions, to fix them.
The standard functions replaced are these:
 `bounds-of-thing-at-point' - Better behavior.
                              Accept optional arg SYNTAX-TABLE.
 `form-at-point'            - Accept optional arg SYNTAX-TABLE.
 `list-at-point'            - Better behavior.
                              Accept optional arg SYNTAX-TABLE.
 `symbol-at-point'          - Use `emacs-lisp-mode-syntax-table'.
 `thing-at-point'           - Ensure it returns a string or nil.
                              Accept optional arg SYNTAX-TABLE.
 `thing-at-point-bounds-of-list-at-point'
                            - Better behavior.  Accept optional
                              args UP and UNQUOTEDP.

\(fn)" t nil)

(intern "whitespace-&-newlines")

(autoload 'find-fn-or-var-nearest-point "thingatpt+" "\
Go to the definition of the function or variable nearest the cursor.
With a prefix arg, or if no function or variable is near the cursor,
prompt for the function or variable to find, instead.

\(fn &optional CONFIRMP)" t nil)

;;;***

;;;### (autoloads nil nil ("dash.el" "eproject-plus.el" "sequential-command.el"
;;;;;;  "smart-compile+.el") (20852 62602 224056 398000))

;;;***

(provide 'my-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; my-loaddefs.el ends here
