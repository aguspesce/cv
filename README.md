# Curriculum Vitae

I create a simpler Markdown version of my CV.

**Sources for building my academic CV**

Pdf versions of my CV are available in [English](https://aguspesce.github.io/cv/cv.pdf).

A html version of the CV can be found at https://aguspesce.github.io/cv

It basically uses `pandoc` for creating a html and pdf version of the CV with a [nice CSS stylesheet](https://blog.chmd.frediting-a-cv-in-markdown-with-pandoc.html).

I got inspiration and knowledge for creating this workflow from:

- [elipapa/markdown-cv](https://elipapa.github.io/markdown-cv/)
- https://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html
- https://sdsawtelle.github.io/blog/output/simple-markdown-resume-with-pandoc-and-wkhtmltopdf.html
- https://mszep.github.io/pandoc_resume/

## How to build

I recommend using the `Makefile` for building the CV.

Requirements:

- `make`
- `pandoc`
- `python` (if you want to serve the html file locally)

For creating the PDF:

```
make pdf
```

For creating the html version:

```
make html
```

Use `make serve` to actually see the html version through http://localhost:8002
