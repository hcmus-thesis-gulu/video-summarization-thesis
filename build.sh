# Latex compilation script
# Check if there is 1 argument being the name of the file to be compiled

if [ $# -eq 0 ]
then
    echo "No filename is supplied"
    exit 1
fi

# Check if the file exists
if [ ! -f $1.tex ]
then
    echo "File $1.tex does not exist"
    exit 1
fi

# Compile the file with flow pdflatex -> bibtex -> pdflatex
pdflatex -interaction=nonstopmode $1.tex
bibtex $1
pdflatex -interaction=nonstopmode $1.tex