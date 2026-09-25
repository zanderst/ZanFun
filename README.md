# ZanFun

My own R helper functions.

## Install

```r
remotes::install_github("zanderst/ZanFun")
library(ZanFun)
```

## Functions

- `mycols(10)`: my colour palette, most-different (and colour-blind friendly) colours first; shades added when more than 23 are needed.

## Adding a new function

1. Put it in a new file in `R/`, with `#' @export` above it.
2. Run `devtools::document()` (updates NAMESPACE and help pages).
3. Commit and push. Reinstall with `remotes::install_github()` to use the new version.
