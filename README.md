# Curriculum Vitae

An HTML version of the academic CV can be found at
https://aguspesce.github.io/cv .

My CV is also available in a
[PDF versions](https://raw.githubusercontent.com/aguspesce/cv/gh-pages/cv_en.pdf).

It uses `pandoc` for creating a html version of the CV with a
[nice CSS stylesheet](https://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html),
and then `wkhtmltopdf` to create a PDF.

The whole process is automated through GitHub Actions, so after any new commit
on `master`, both pdf and html versions of the CV are automatically built and
uploaded to the `gh-pages` branch.

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
