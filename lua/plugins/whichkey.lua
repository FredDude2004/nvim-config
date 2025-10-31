return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
        -- gain access to the which key plugin
        local wk = require('which-key')
        wk.add({
            { "<leader>/", group = "Comments" },
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ebug" },
            { "<leader>e", group = "[E]xplorer" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>g", group = "[G]it" },
            { "<leader>J", group = "[J]ava" },
            { "<leader>w", group = "[W]indow" },
        })

        -- which_key.register({
        --     ['<leader>/'] = {name = "Comments", _ = 'which_key_ignore'},
        --     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        --     ['<leader>d'] = {name = '[D]ebug' , _ = 'which_key_ignore' },
        --     ['<leader>e'] = {name = '[E]xplorer', _ = 'which_key_ignore'},
        --     ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        --     ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        --     ['<leader>J'] = { name = '[J]ava', _ = 'which_key_ignore' },
        --     ['<leader>w'] = {name = '[W]indow', _ = 'which_key_ignore'}
        -- })

    end
}
