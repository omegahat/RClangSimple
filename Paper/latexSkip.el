(add-hook 'latex-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'ispell-skip-region-alist)
               (cons '(("\\begin{RCode}" . "\\end{RCode}")
                       ("\\begin{CCode}" . "\\end{CCode}")
                       )
         	      ispell-skip-region-alist))))