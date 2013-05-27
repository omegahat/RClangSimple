RClang.pdf:

# Examples.tex
RClang.pdf: RClang.tex rclang.bib  protect.tex rffi.tex protectCodeFigure.tex mutability.tex mutabilityFigure.tex callgraph.pdf clangConcepts.tex sinLogASFig.tex
	-pdflatex RClang
	-pdflatex RClang
	bibtex RClang
	-pdflatex RClang

clean:
	-rm  rclang.{aux,log,out,blg}
