return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        model = "claude-3.7-sonnet",

        window = {
            layout = "float",
            width = 0.8,
            height = 0.8,
        },

        mappings = {
            complete = {
                normal = "<Tab>",
                insert = "<C-Tab>",
            },
            reset = {
                normal = "<C-n>",
                insert = "<C-n>",
            },
            show_help = {
                normal = "g?",
            },
        },
    },
    config = function(_, opts)
        local chat = require("CopilotChat")
        chat.setup(opts)

        vim.keymap.set("n", "<leader>ac", chat.toggle)
        vim.keymap.set("n", "<leader>am", chat.select_model)

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "copilot-chat",
            callback = function()
                vim.opt_local.relativenumber = false
                vim.opt_local.number = false
            end,
        })
    end
}
