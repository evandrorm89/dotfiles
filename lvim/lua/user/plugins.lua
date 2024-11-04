lvim.plugins = {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestions = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },

    { 'jose-elias-alvarez/typescript.nvim' },
    { 'mg979/vim-visual-multi' },

    { 'lunarvim/lunar.nvim' },
    { "morhetz/gruvbox" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/sonokai" },
    { "sainnhe/edge" },
    { "lunarvim/horizon.nvim" },
    { "tomasr/molokai" },
    { "ayu-theme/ayu-vim" },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "latte",
        },
    },

    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end
    },

    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
                options = { "buffers", "curdir", "tabpages", "winsize" }
            })
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "dracula",
                    section_separators = { "", "" },
                    component_separators = { "", "" }
                }
            })
        end
    },

    { "christoomey/vim-tmux-navigator" },
    { "tpope/vim-surround" },
    { "felipec/vim-sanegx",            event = "BufRead" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { "tpope/vim-repeat" },

    { "ThePrimeagen/harpoon" },

    { "ThePrimeagen/vim-be-good" },

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop').setup()
        end
    },

    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
    },

    {
        'AckslD/nvim-trevJ.lua',
        config = 'require("trevj").setup()',
        init = function()
            vim.keymap.set('n', '<leader>j', function()
                require('trevj').format_at_cursor()
            end)
        end,
    },
}

table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        local ok, cmp = pcall(require, "copilot_cmp")
        if ok then cmp.setup({}) end
    end,
})

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
end
