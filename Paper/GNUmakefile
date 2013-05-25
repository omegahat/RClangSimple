RClang.pdf:

# Examples.tex
%.pdf: %.tex rclang.bib  protect.tex
	-pdflatex $*
	-pdflatex $*
	bibtex $*
	-pdflatex $*

clean:
	-rm  rclang.{aux,log,out,blg}
