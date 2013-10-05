build(){
	pdflatex -interaction=nonstopmode $1
	bibtex $2
	pdflatex -interaction=nonstopmode $1
	pdflatex -interaction=nonstopmode $1
}

# build once by default
build hw1.tex

# watch for alterations
while inotifywait hw1.tex; do
  build hw1.tex
done
