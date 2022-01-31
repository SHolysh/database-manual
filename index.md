---
title:  "Cover and Table of Contents"
author: "ormgpmd"
date:   "20220131"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    'index.html')
                )
            }
        )
---

![Cover Page](./Cover/cover.jpg)

## Table of Contents

#### [Forward](./Forward/forward.html)

