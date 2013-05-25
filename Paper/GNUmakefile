RClang.pdf:

# Examples.tex
%.pdf: %.tex rclang.bib  
	-pdflatex $*
	-pdflatex $*
	bibtex $*
	-pdflatex $*

clean:
	-rm  rclang.{aux,log,out,blg}
