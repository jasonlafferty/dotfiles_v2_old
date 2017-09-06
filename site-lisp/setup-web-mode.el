(use-package web-mode :ensure t
  :mode
  (("\\.twig\\'" . web-mode)
   ("\\.html?\\'" . web-mode)
   ("\\.hbs\\'" . web-mode)
   ("\\.jsx\\'" . web-mode))
  :config
  (setq
   web-mode-disable-auto-pairing nil
   web-mode-disable-css-colorization nil
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-enable-auto-closing t
   web-mode-enable-auto-opening t
   web-mode-enable-auto-pairing t
   web-mode-enable-auto-indentation t
))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))



(provide 'setup-web-mode)
