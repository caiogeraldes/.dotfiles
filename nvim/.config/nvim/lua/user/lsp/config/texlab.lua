return {
    settings = {
        texlab = {
            build = {onSave = true, executable = "lualatex"},
            diagnostics = {
                ignoredPatterns = {
                    "Overfull", "Language 'latin' not supported",
                    "Package biblatex Warning: File"
                }
            },
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            },
            chktex = {onOpenAndSave = true}
        }
    }
}
