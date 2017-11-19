;;; dotenv-mode.el --- Major mode for .env files -*- lexical-binding: t; -*-

;; Author: Preetpal S. Sohal
;; URL: https://github.com/preetpalS/emacs-dotenv-mode
;; Version: 0.0.2
;; Package-Requires: ((emacs "24.3"))
;; License: GNU General Public License Version 3

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Usage:
;; (require 'dotenv-mode) ; unless installed from a package

;;; Code:

(defgroup dotenv-mode ()
  "Customize group for dotenv-mode.el"
  :group 'lisp
  :prefix "dotenv-mode-")

(defcustom dotenv-mode-disable-wildcard-env-filetype-support nil
  "Set to a truthy value to disable `dotenv-mode' for all files not ending with `\".env\"'."
  :type 'boolean
  :group 'dotenv-mode)

(defconst dotenv-mode-highlights
  '(("#.*" . font-lock-comment-face)
    ("export +" . font-lock-keyword-face)
    ;; (":\\|=" . font-lock-negation-char-face)
    ("[[:alpha:]_]+[[:alpha:][:digit:]_]*[:=]+" . font-lock-variable-name-face)
    ("\$[[:alpha:]]+[[:alpha:][:digit:]_]*" . font-lock-constant-face)
    ))

;;;###autoload
(define-derived-mode dotenv-mode prog-mode ".env"
  "Major mode for `.env' files."
  :abbrev-table nil
  (setq-local font-lock-defaults '(dotenv-mode-highlights))
  )

;;;###autoload
(add-to-list 'auto-mode-alist
             (if dotenv-mode-disable-wildcard-env-filetype-support
                 '("\\.env\\'" . dotenv-mode)
               '("\\.env.*\\'" . dotenv-mode)))

(provide 'dotenv-mode)

;;; dotenv-mode.el ends here
