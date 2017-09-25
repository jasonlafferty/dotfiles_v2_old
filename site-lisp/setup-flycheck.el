(use-package flycheck :ensure t
  :diminish ""
  :config

  (setq flycheck-highlighting-mode 'lines)
  (message "setup for flycheck working!!")
  ;; flycheck for eslint
  ;; https://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html#improving_the_jsx_syntax-hightlighting_in_web-mode
  (defun my/eslint ()
    (message "myeslint")
    (setq-local flycheck-javascript-eslint-executable "/usr/local/bin/eslint"))
  (add-hook 'flycheck-mode-hook #'my/eslint)


  ;; Add better hightlighting for flycheck
  ;; found https://github.com/flycheck/flycheck/issues/350
  (eval-after-load 'flycheck
    '(progn
       (set-face-attribute 'flycheck-warning nil
                           :foreground "yellow"
                           :background "red"
                           :underline "red")))

  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  (global-flycheck-mode))
(provide 'setup-flycheck)
