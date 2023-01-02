;;; soria-theme-tree.el --- Files tree integration of the soria theme -*- lexical-binding: t; no-byte-compile: t -*-

;; Copyright (C) 2021-2023 Miquel Sabaté Solà <mikisabate@gmail.com>
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

;; Author: Miquel Sabaté Solà <mikisabate@gmail.com>
;; Version: 0.4.1
;; Package-Requires: ((emacs "25.1") (treemacs "2.8") (all-the-icons "4.0.1"))
;; Keywords: faces
;; URL: https://github.com/mssola/soria

;;; Commentary:
;;
;; This package provides treemacs integration to the soria theme.  It uses all-the-icons
;; underneath, but it does not use all the available icons out there to keep things
;; simpler.

;;; Credits:
;;
;; Adapted from the kaolin and the doom-emacs themes repositories.

(defun soria-theme-tree--remove-fringes ()
  "Remove fringes from the special window."

  (when (display-graphic-p)
    (setq left-fringe-width 0
          right-fringe-width 0)))

(defun soria-theme-tree--hook ()
  "Basic definitions to be set on initialization."

  (setq line-spacing 1
        tab-width 1
        mode-line-format nil))

(defun soria-theme-tree--setup ()
  "Setup soria for treemacs."

  (require 'treemacs)

  (add-hook 'treemacs-mode-hook #'soria-theme-tree--hook)
  (add-hook 'treemacs-mode-hook #'soria-theme-tree--remove-fringes)
  (advice-add 'treemacs-select-window :after #'soria-theme-tree--remove-fringes)

  (setq treemacs-indentation 1
        treemacs-indentation-string "  ")

  (treemacs-create-theme
   "soria"
   :config
   (progn
     ;; Set fallback icon
     (treemacs-create-icon
      :icon (format "  %s\t"
                    (all-the-icons-octicon "file-text"
                                           :height 1.0 :face 'font-lock-comment-face))
      :extensions (fallback))

     (treemacs-create-icon
      :icon (format " %s\t"
                    (all-the-icons-octicon "repo" :height 1.0 :v-adjust -0.1
                                           :face 'font-lock-preprocessor-face))
      :extensions (root))

     (treemacs-create-icon
      :icon (format "%s\t%s\t"
                    (all-the-icons-octicon "chevron-down" :height 0.75 :v-adjust 0.1
                                           :face 'font-lock-builtin-face)
                    (all-the-icons-octicon "file-directory" :v-adjust 0
                                           :face 'font-lock-builtin-face))
      :extensions (dir-open))

     (treemacs-create-icon
      :icon (format "%s\t%s\t"
                    (all-the-icons-octicon "chevron-right" :height 0.75
                                           :v-adjust 0.1 :face 'font-lock-builtin-face)
                    (all-the-icons-octicon "file-directory" :v-adjust 0
                                           :face 'font-lock-builtin-face))
      :extensions (dir-closed))

     (treemacs-create-icon
      :icon (format "%s\t%s\t"
                    (all-the-icons-octicon "chevron-down" :height 0.75 :v-adjust 0.1
                                           :face 'font-lock-comment-face)
                    (all-the-icons-octicon "package" :v-adjust 0 :face
                                           'font-lock-comment-face))
      :extensions (tag-open))
     (treemacs-create-icon
      :icon (format "%s\t%s\t"
                    (all-the-icons-octicon "chevron-right" :height 0.75 :v-adjust 0.1
                                           :face 'font-lock-comment-face)
                    (all-the-icons-octicon "package" :v-adjust 0
                                           :face 'font-lock-comment-face))
      :extensions (tag-closed))

     (treemacs-create-icon
      :icon (format "%s\t" (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0
                                                  :face 'font-lock-comment-face))
      :extensions (tag-leaf))

     (treemacs-create-icon
      :icon (format "%s\t" (all-the-icons-octicon "flame" :v-adjust 0
                                                  :face 'all-the-icons-red))
      :extensions (error))

     (treemacs-create-icon
      :icon (format "%s\t" (all-the-icons-octicon "stop" :v-adjust 0
                                                  :face 'all-the-icons-orange))
      :extensions (warning))

     (treemacs-create-icon
      :icon (format "%s\t" (all-the-icons-octicon "info" :height 0.75 :v-adjust 0.1
                                                  :face 'all-the-icons-green))
      :extensions (info))

     ;; Icons for filetypes

     (treemacs-create-icon
      :icon (format "  %s\t" (all-the-icons-octicon "file-code" :v-adjust 0
                                                    :face 'font-lock-comment-face))
      :extensions ("a.out" "adoc" "asciidoc" "bashrc" "c" "cabal" "cabal" "cask"
                   "cc" "clj" "cljc" "cljs" "conf" "cpp" "css" "csv" "cxx" "dart"
                   "dockerfile" "dockerfile" "editorconfig" "eex" "el" "elm" "erb"
                   "ex" "exs" "fish" "gemfile" "gitignore" "git" "gitconfig"
                   "gitmodules" "go" "h" "hh" "hpp" "hs" "htm" "html" "hy"
                   "ideavimrc" "ini" "inputrc" "j2" "java" "jinja2" "jinja2" "jl"
                   "js" "json" "jsx" "kt" "kt" "kts" "lhs" "lisp" "lua" "lua"
                   "makefile" "markdown" "md" "ml" "mli" "nim" "nim" "nims" "nix"
                   "org" "perl" "php" "pl" "plt" "pm" "pm6" "pp" "pp" "py" "pyc"
                   "r" "racket" "rake" "rb" "re" "rei" "rkt" "rktd" "rktl" "rs"
                   "ru" "sbt" "scala" "scm" "scrbl" "scribble" "scss" "sh"
                   "sql" "sql" "styles" "sv" "tex" "toml" "tpp" "tridactylrc"
                   "ts" "tsx" "txt" "v" "vagrantfile" "vh" "vimperatorrc"
                   "vimrc" "vrapperrc" "vue" "xml" "xsl" "yaml" "yml" "zsh"
                   "zshrc"))

     (treemacs-create-icon
      :icon (format "  %s\t" (all-the-icons-octicon "file-media") :v-adjust 0
                    :face 'font-lock-constant-face)
      :extensions ("jpg" "jpeg" "png" "gif" "ico" "tif" "tiff" "svg" "bmp" "psd" "ai"
                   "eps" "indd" "mov" "avi" "mp4" "webm" "webp" "mkv" "wav" "mp3"
                   "ogg" "midi"))

     (treemacs-create-icon
      :icon (format "  %s\t" (all-the-icons-octicon "file-zip") :v-adjust 0
                    :face 'font-lock-number-face)
      :extensions ("zip" "xz" "tar" "gz" "7z" "rar"))))

  (treemacs-load-theme "soria"))

;;;###autoload
(defun soria-theme-tree-config ()
  "Setup the configuration for treemacs support."

  (soria-theme-tree--setup))

;;; Code:

(provide 'soria-theme-tree)

;;; soria-theme-tree.el ends here
