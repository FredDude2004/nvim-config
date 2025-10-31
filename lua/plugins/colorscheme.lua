return {
    -- Shortened Github Url
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- Make sure to set the color scheme when neovim loads and configures the catppuccin mocha
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
