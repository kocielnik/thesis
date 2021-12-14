# Usage

Write your thesis in the following format:

```markdown
---
title: Thesis Title
author: Your Name
university: Your University
---

# Introduction

This thesis has been written using a \keyword{DTP} package called Dyplom-Pro
[^k_dyplom-pro_2019].

```

Save it to file `thesis.md`, then to generate the PDF output, issue:

```bash
pandoc -f markdown -t latex -o thesis.pdf thesis.md
```

For more details on how to use this package, refer to the [guide](guide.md).

# Usage without installing Pandoc

You can use an online tool to generate LaTeX from Markdown. Then you can paste
the LaTeX source to your LaTeX project, eg. on Overleaf. The summary of steps
is as follows:

1. Write thesis text in Markdown
2. Generate LaTeX from Markdown using
   https://pandoc.org/try/?from=markdown&to=latex
3. Include LaTeX in the example project as main.tex.

# Other options to get LaTeX from Markdown

1. https://www.docverter.com/
2. Authorea.com
3. Self-hosted from https://github.com/mrded/pandoc-as-a-service

Hello, world!
