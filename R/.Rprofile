options(repos = c("https://vps.fmvz.usp.br/CRAN/"))

# Auto-completion for package names.
utils::rc.settings(ipck = TRUE)
library(colorout)

if (Sys.getenv("NVIMR_TMPDIR") == "") {
  options(defaultPackages = c(
    "utils", "grDevices", "graphics", "stats", "methods"
  ))
} else {
  options(defaultPackages = c(
    "utils", "grDevices", "graphics", "stats", "methods", "nvimcom"
  ))
}


if (interactive()) {
  if (Sys.getenv("NVIMR_TMPDIR") != "") {
    options(nvimcom.verbose = 1)
    library(nvimcom)
  }
}
