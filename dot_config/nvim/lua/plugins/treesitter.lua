return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "cpp", "c_sharp", "rust", "lua", "json", "vim", "vimdoc" },
            sync_install = false,
            highlight = { enable = true },
            indent = { 
                enable = true,
                disable = { "lua" },
            },  
        })
    end
}
