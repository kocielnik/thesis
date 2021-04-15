# Getting Started

> I want to start writing my thesis in Markdown right away, and then convert it
> to PDF.

Sure thing. Start writing in a new `.md` file, say `draft.md`. Then issue the
following:

```bash
pandoc --from=markdown \
       --to=latex \
       --output=thesis.pdf
       draft.md
```

If you have images that you want to include in the output, add the option
`--resource-path` to your command. An example is given below.

```bash
pandoc --from=markdown \
       --to=latex \
       --output=thesis.pdf \
       --resource-path=images
       draft.md
```

To add requirement-compliant formatting to the thesis, first let us install the LaTeX document class using TeXLive Manager as follows.

```bash
tlmgr install pw-eiti-mgr
```

Acquiring superuser privileges with `sudo` may be required to run the above
command.

Then, we include the package in the header of our document to be rendered. We
use for this the `--variable=documentclass:eitidypl` parameter. This is
illustrated in the example below.

```bash
pandoc --from=markdown \
       --to=latex \
       --output=thesis.pdf \
       --resource-path=images \
       --variable=documentclass:eitidypl \
       draft.md
```


