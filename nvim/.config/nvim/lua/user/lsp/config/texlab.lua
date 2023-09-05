return {
  settings = {
    texlab = {
      build = { onSave = true, executable = "lualatex" },
      diagnostics = {
        ignoredPatterns = {
          "Overfull",
          "Language 'latin' not supported",
          "Package biblatex Warning: File",
          "Wrong length of dash may have been used.",
        },
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = { onOpenAndSave = true },
    },
  },
}
