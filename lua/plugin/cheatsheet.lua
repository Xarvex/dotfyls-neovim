return {
    "doctorfree/cheatsheet.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim"
    },
    cmd = { "Cheatsheet", "CheatsheetEdit" },
    keys = {
        { "<leader>?", vim.cmd.Cheatsheet }
    },
    config = function()
        local ctactions = require("cheatsheet.telescope.actions")
        require("cheatsheet").setup({
            bundled_cheetsheets = {
                enabled = {
                    "default",
                    "lua",
                    "markdown",
                    "regex",
                    "netrw",
                    "unicode"
                },
                disabled = { "nerd-fonts" }
            },
            bundled_plugin_cheatsheets = {
                enabled = { "telescope.nvim" },
                disabled = { "gitsigns" }
            },
            include_only_installed_plugins = true,
            telescope_mappings = {
                ["<CR>"] = ctactions.select_or_fill_commandline,
                ["<leader><CR>"] = ctactions.select_or_execute,
                ["<C-Y>"] = ctactions.copy_cheat_value,
                ["<C-E>"] = ctactions.edit_user_cheatsheet
            }
        })
    end
}
