return {
    {
        'nvim-telescope/telescope.nvim',
        -- pull a specific version of the plugin
        tag = '0.1.6',
        dependencies = {
            -- general purpose plugin used to build user interfaces in neovim plugins
            'nvim-lua/plenary.nvim'
        },
        config = function()
            -- get access to telescopes built in functions
            local builtin = require('telescope.builtin')
            -- set a vim motion to <Space> + s + h to search the help
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            -- set a vim motion to <Space> + s + f to search for files by their names
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
            -- set a vim motion to <Space> + s + g to search for files based on the text inside of them
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch by [G]rep" })
            -- set a vim motion to <Space> + s + d to search for Code Diagnostics in the current project
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            -- set a vim motion to <Space> + s + r to resume the previous search
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earcher [R]esume' })
            -- set a vim motion to <Space> + s + . to search for Recent Files
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            -- set a vim motion to <Space> + s + b to search Open Buffers
            vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch Existing [B]uffers' })
            -- set a vim motion to <Space> + / to do a fuzzy find in current buffer
            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- set a vim motion to <Space> + s + / to do a fuzzy find in current buffer
            vim.keymap.set('n', '<leader>s/', function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = '[S]earch [/] in Open Files' })

            -- set a vim motion to <Space> + s + n to search in your NeoVim config
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[S]earch [N]eovim files' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            -- get access to telescopes navigation functions
            local actions = require("telescope.actions")

            require("telescope").setup({
                -- use ui-select dropdown as our ui
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                -- set keymappings to navigate through items in the telescope io
                mappings = {
                    i = {
                        -- use <cltr> + n to go to the next option
                        ["<C-n>"] = actions.cycle_history_next,
                        -- use <cltr> + p to go to the previous option
                        ["<C-p>"] = actions.cycle_history_prev,
                        -- use <cltr> + j to go to the next preview
                        ["<C-j>"] = actions.move_selection_next,
                        -- use <cltr> + k to go to the previous preview
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                -- load the ui-select extension
                require("telescope").load_extension("ui-select")
            })
        end
    }
}
