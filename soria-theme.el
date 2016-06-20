;;; soria-theme.el --- A xoria256 theme with some colors from openSUSE.

;; Copyright (C) 2016 Miquel Sabaté Solà <mikisabate@gmail.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This is a color theme based on xoria256 (vim.org #2140) but with some
;; modifications here and there with colors from openSUSE's guidelines
;; (http://opensuse.github.io/branding-guidelines/).

;;; Credits:
;;
;; FEI Hao for the xoria256 port (https://github.com/suxue/xoria256-emacs).
;; This theme is *largely* based on this port.
;;
;; Kelvin Smith for the port of the Monokai theme to Emacs
;; (https://github.com/oneKelvinSmith/monokai-emacs). I've taken a lot of
;; inspiration from its source code.
;;
;; I've adapted some of the color IDs with this gist:
;;  https://gist.github.com/MicahElliott/719710

;;; Code:

;; Initialization stuff.

(unless (>= emacs-major-version 24)
  (error "The soria theme requires Emacs 24 or later!"))

(deftheme soria "A xoria256 theme with some colors from openSUSE")

;; First of all, let's create our own font-lock for numbers.

(make-face 'font-lock-number-face)
(set-face-attribute 'font-lock-number-face nil :inherit font-lock-constant-face)
(setq font-lock-number-face 'font-lock-number-face)

; add-font-lock-numbers adds to the list of keywords of font-lock-number-face
; the supported numeric formats (decimal, octal, hex and bin).
(defun add-font-lock-numbers ()
  (defvar font-lock-number    "[0-9]+\\([eE][+-]?[0-9]*\\)?")
  (defvar font-lock-hexnumber "0[xX][0-9a-fA-F]+")
  (defvar font-lock-binnumber "0[bB][01]+")

  (font-lock-add-keywords nil (list
    (list (concat "\\<\\(" font-lock-number "\\)\\>" )
     0 font-lock-number-face)
    (list (concat "\\<\\(" font-lock-hexnumber "\\)\\>" )
     0 font-lock-number-face)
    (list (concat "\\<\\(" font-lock-binnumber "\\)\\>" )
     0 font-lock-number-face)))
)

;; The color theme itself.

(let*
  ((class '((class color) (min-colors 89)))
    (soria-purple       "#dfafdf")
    (soria-darkpurple   "#875f87")
    (soria-white        "#d0d0d0")
    (soria-darkgray     "#1c1c1c")
    (soria-brightgreen  "#81c13b")
    (soria-green        "#b9dc92")
    (soria-darkgreen    "#2f5361")
    (soria-gray         "#808080")
    (soria-linegray     "#3a3a3a")
    (soria-statusgray   "#4e4e4e")
    (soria-statusncgray "#b2b2b2")
    (soria-black        "#000000")
    (soria-whitest      "#eeeeee")
    (soria-yellow       "#ffffaf")
    (soria-orange       "#d7af87")
    (soria-redpastel    "#d78787")
    (soria-blue         "#87afd7"))

  (custom-theme-set-faces
    'soria
    ;; Ensure sufficient contrast on low-color terminals.
    `(default (
      (((class color) (min-colors 256))
       (:foreground ,soria-white :background ,soria-darkgray))))

    ;; Highlighting faces

    `(highlight
      ((,class (:background ,soria-darkpurple
                :foreground ,soria-white))))

    `(region
      ((,class (:inherit highlight))))

    `(lazy-highlight
      ((,class (:inherit highlight))))

    `(isearch
      ((,class (:background ,soria-green
                :foreground ,soria-black))))

    `(trailing-whitespace
      ((,class (:background ,soria-brightgreen))))

    ;; Font lock faces

    `(font-lock-builtin-face
      ((,class (:foreground ,soria-blue))))

    `(font-lock-comment-face
      ((,class (:foreground ,soria-gray))))

    `(font-lock-comment-delimiter-face
      ((,class (:inherit font-lock-comment-face))))

    `(font-lock-doc-face
      ((,class (:inherit font-lock-comment-face))))

    `(font-lock-function-name-face
      ((,class (:foreground ,soria-purple))))

    `(font-lock-variable-name-face
      ((,class (:foreground ,soria-white))))

    `(font-lock-preprocessor-face
      ((,class (:foreground ,soria-green))))

    `(font-lock-constant-face
      ((,class (:foreground ,soria-yellow))))

    `(font-lock-keyword-face
      ((,class (:foreground ,soria-blue))))

    `(font-lock-string-face
      ((,class (:foreground ,soria-yellow))))

    `(font-lock-type-face
      ((,class (:foreground ,soria-blue))))

    `(font-lock-number-face
      ((,class (:foreground ,soria-orange))))

    `(font-lock-negation-char-face
      ((,class (:inherit default))))

    `(font-lock-warning-face
      ((,class (:foreground ,soria-green))))

    ;; Misc

    `(hl-line
      ((,class (:background ,soria-linegray))))

    `(linum-highlight-face
      ((,class (:background ,soria-darkgray
                :foreground ,soria-yellow))))

    `(show-paren-match
      ((,class (:background ,soria-brightgreen
                :foreground ,soria-darkgreen))))

    ;; Mode line faces

    `(mode-line
      ((,class
        (:box (:line-width -1 :style released-button)
         :background ,soria-statusgray
         :foreground ,soria-white))))

    `(mode-line-inactive
      ((,class
        (:box (:line-width -1 :style released-button)
         :background ,soria-linegray
         :foreground ,soria-statusncgray))))

    `(compilation-mode-line-fail
      ((,class (:foreground ,soria-redpastel))))

    `(compilation-mode-line-run
      ((,class (:foreground ,soria-yellow))))

    `(compilation-mode-line-exit
      ((,class (:foreground ,soria-brightgreen))))

    ;; Escape and prompt faces

    `(minibuffer-prompt
      ((,class (:foreground ,soria-white))))

    `(escape-glyph
      ((,class (:foreground ,soria-redpastel))))

    `(error
      ((,class (:foreground ,soria-white))))

    `(warning
      ((,class (:foreground ,soria-orange))))

    `(success
      ((,class (:foreground ,soria-blue))))
  )
)

;; And finally hook the defined font locks and call provide-theme.

(add-hook 'prog-mode-hook 'add-font-lock-numbers)

(provide-theme 'soria)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; soria-theme.el ends here
