# Curriculum Vitae

Sources for my old CV written using `pandoc` and markdown.

## Updated CV

You can download an updated version of my resume at
[https://github.com/aguspesce/cv-latex](https://github.com/aguspesce/cv-latex)

It uses `pandoc` for creating a html version of the CV with a
[nice CSS stylesheet](https://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html),
and then `wkhtmltopdf` to create a PDF.

## How to build

I recommend using the `Makefile` for building the CV.

**Requirements:**

- `make`
- `pandoc`
- `wkhtmltopdf`
- `python` (if you want to serve the html file locally)

For creating the PDF:

```
make pdf
```

For creating the html version:

```
make html
```
