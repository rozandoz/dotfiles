return { 
    "nvim-treesitter/nvim-treesitter",
    branch= "main",
    build = ":TSUpdate",
    config = function () 
        require("nvim-treesitter").install({ "c", "cpp", "c_sharp", "rust", "lua", "json", "vim", "vimdoc" })
    end
}
