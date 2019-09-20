# Usage

Write your thesis in the following format:

```markdown
---
title: Thesis Title
author: Your Name
university: Your University
---

# Introduction

This thesis has been written using a \keyword{DTP} package called Dyplom-Pro [^k_dyplom-pro_2019].

```

Save it to file `thesis.md`, then to generate the PDF output, issue:

```bash
pandoc -f markdown -t latex -o thesis.pdf thesis.md
```

For more details on how to use this package, refer to the [guide](guide.md).

